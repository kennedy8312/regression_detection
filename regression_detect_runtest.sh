#!/bin/bash
# 2024.01.10 by kennedy8312

# Define MySQL connection information
DB_HOST=$1
DB_PORT=$2
DB_USER=$3
#DB_PASSWORD="your_password"
DB_NAME=$4
TEST_SCRIPT=$5
TEST_RESULT=$6
TEST_SCRIPT_LOC=$7
TIDB_LOC=$8
max_attempts=$9
max_wait=${10}
status_file=${11}

run_tests() {
    # Switch to the current commit
    cd $TIDB_LOC
    git checkout $1
    git_hash=$(git rev-parse HEAD)

    # Run pre-test setup
    # sourcegraph.com/sourcegraph/appdash would not be found since the resource became "failure: 404 error".
    sed -i '' 's|sourcegraph.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0 h1:ucqkfpjg9WzSUubAO62csmucvxl4/JeW3F4I4909XkM=|github.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0 h1:IJ3DuWHPTJrsqtIqjfdmPTELdTFGefvrOa2eTeRBleQ=|g' go.sum
    sed -i '' 's|sourcegraph.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0/go.mod h1:hI742Nqp5OhwiqlzhgfbWU4mW4yO10fP+LoT9WOswdU=|github.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0/go.mod h1:V952P4GGl1v/MMynLwxVdWEbSZJx+n0oOO3ljnez+WU=|g' go.sum
    sed -i '' 's|sourcegraph.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67 h1:e1sMhtVq9AfcEy8AXNb8eSg6gbzfdpYhoNqnPJa+GzI=|github.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67 h1:8ZnTA26bBOoPkAbbitKPgNlpw0Bwt7ZlpYgZWHWJR/w=|g' go.sum
    sed -i '' 's|sourcegraph.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67/go.mod h1:L5q+DGLGOQFpo1snNEkLOJT2d1YTW66rWNzatr3He1k=|github.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67/go.mod h1:tNZjgbYncKL5HxvDULAr/mWDmFz4B7H8yrXEDlnoIiw=|g' go.sum
    echo "
replace (
  sourcegraph.com/sourcegraph/appdash => github.com/sourcegraph/appdash v0.0.0-20190731080439-ebfcffb1b5c0
  sourcegraph.com/sourcegraph/appdash-data => github.com/sourcegraph/appdash-data v0.0.0-20151005221446-73f23eafcf67
)" >> go.mod
    #make bazel_prepare
    rm ./bin/tidb-server
    rm ./bin/tidb.log
    rm -rf /tmp/tidb
    make
    ./bin/tidb-server -log-file ./bin/tidb.log &

    elapsed=0
    until mysqladmin ping -h $DB_HOST -P $DB_PORT -u $DB_USER --silent || [ $elapsed -ge $max_wait ]; do
    sleep 1
    #echo $elapsed
    ((elapsed++))
    done

    if [ $elapsed -ge $max_wait ]; then
    echo "Timeout: Cannot connect to tidb-server: ${git_hash}"
    pkill tidb-server
    exit 1
    fi

    echo "--------------------------------------------------------------------------------------"
    echo "-----------------Regression Test Result on ${git_hash}-----------------"
    echo "Server on ${git_hash} started."

    # Connect to the MySQL database and execute an SQL script
    #echo "$TEST_SCRIPT_LOC"
    cd $TEST_SCRIPT_LOC

    exit_status=0

    # 设置最大循环次数
    attempt=1  # 初始化当前循环次数
    while [ $attempt -le $max_attempts ]; do
        # 执行查询获取实际结果
        actual_result=$(mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -D $DB_NAME --local-infile=true < $TEST_SCRIPT 2>&1)  
        # 从文件中读取期望结果
        expected_result=$(cat $TEST_RESULT)  

        if [ "$expected_result" != "$actual_result" ]; then
            echo "Validation failed at run ${attempt}. ${git_hash} is a bad label."
            echo "Expected: "
            echo "$expected_result"
            echo "Actual: "
            echo "$actual_result"
            results+=("Commit $git_hash : Failure")
            echo "Commit $git_hash : Failure" >> ${status_file}
            exit_status=1
            break  # 结果不等，跳出循环
        fi
    attempt=$((attempt + 1))  # 增加循环次数
    done

    if [ $attempt -gt $max_attempts ]; then
        echo "Validation passed. ${git_hash} is a good label"
        results+=("Commit $git_hash : Success")
        exit_status=0
        echo "Commit $git_hash : Success" >> ${status_file}
    fi

    echo "-----------------Test Case-----------------"
    file_testcase=$(basename "${TEST_SCRIPT}")
    echo "mysql -h ${DB_HOST} -P ${DB_PORT} -u ${DB_USER} -D ${DB_NAME} --local-infile=true < ${file_testcase}"
    echo "${file_testcase}: "
    cat ${TEST_SCRIPT}
    echo ""
    echo "-----------------Test Result-----------------"
    echo "Result : 
${actual_result}"
    echo "-----------------TiDB Version-----------------"
    mysql -h ${DB_HOST} -P $DB_PORT -u $DB_USER -D ${DB_NAME} -e "select tidb_version();" | { IFS= read -r -d '' output; printf '%b\n' "$output"; }
    echo "-----------------End of regression test on ${git_hash}-----------------"
    echo "--------------------------------------------------------------------------------------"

    # Run post-test cleanup
    pkill tidb-server

    cd $TIDB_LOC
    git checkout -- .

    # Exit with the result
    exit $exit_status
}

run_tests