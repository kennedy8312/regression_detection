#!/bin/bash
# 2024-03-01 by kennedy8312

#load config parameters
source detect.config
#check config parameters
source config_check.sh

source $TEST_CONFIG

echo "Start to analyze regression behavior among releases for ${source} ${issue}" 

echo "Start to analyze regression behavior among releases for ${source} ${issue}"  > $log_file
echo "Start to analyze regression behavior among releases for ${source} ${issue}"  > $status_file

TEMP_LOG_FILE="${TEST_SCRIPT_LOC}/tiup-startup-temp.log"

cd $TEST_SCRIPT_LOC

# 遍历版本列表
for version in "${versions[@]}"; do
    
    echo '' > ${TEMP_LOG_FILE}

    # 启动 tiup playground
    ps -ef | grep tiup | grep -v 'grep' | awk '{print $2}' | xargs kill -9
    tiup playground "${version}" 1>"${TEMP_LOG_FILE}" 2>&1 &

    # 等待 tiup playground 启动完毕
    elapsed=0
    while ! grep -q "TiDB Playground Cluster is started, enjoy!" "${TEMP_LOG_FILE}" && [ $elapsed -lt $max_wait ]; do
    sleep 1
    ((elapsed++))
    done

    if [ $elapsed -ge $max_wait ]; then
    echo "Timeout: Failed to start TiDB Playground Cluster for version: ${version}"
    ps -ef | grep tiup | grep -v 'grep' | awk '{print $2}' | xargs kill -9
    exit 1
    fi

    elapsed=0
    until mysqladmin ping -h $DB_HOST -P $DB_PORT -u $DB_USER --silent || [ $elapsed -ge $max_wait ]; do
    sleep 1
    #echo $elapsed
    ((elapsed++))
    done

    if [ $elapsed -ge $max_wait ]; then
    echo "Timeout: Server is started but failed to connect to TiDB Playground Cluster for version: ${version}"
    ps -ef | grep tiup | grep -v 'grep' | awk '{print $2}' | xargs kill -9
    exit 1
    fi

    echo "----------------------------------------------------------------------"
    echo "-----------------Regression Test Result on ${version}-----------------"
    echo "Server on ${version} started."

    # 设置最大循环次数
    attempt=1 # 初始化当前循环次数
    while [ $attempt -le $max_attempts ]; do
        actual_result=$(mysql -h $DB_HOST -P $DB_PORT -u $DB_USER -D $DB_NAME --local-infile=true < $TEST_SCRIPT 2>&1)  # 执行查询获取实际结果

        expected_result=$(cat $TEST_RESULT)  # 从文件中读取期望结果

        if [ "$expected_result" != "$actual_result" ]; then
            echo "Validation failed at run ${attempt}. ${version} is a bad label."
            echo "Expected: "
            echo "$expected_result"
            echo "Actual: "
            echo "$actual_result"
            results+=("Version $version : Failure")
            echo "Version $version : Failure" >> ${status_file}
            break  # 结果不等，跳出循环
        fi
    attempt=$((attempt + 1))  # 增加循环次数
    done

    if [ $attempt -gt $max_attempts ]; then
        echo "Validation passed. ${version} is a good label"
        results+=("Version $version : Success")
        echo "Version $version : Success" >> ${status_file}
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
    echo "-----------------End of regression test on ${version}-----------------"
    echo "----------------------------------------------------------------------"

    ps -ef | grep tiup | grep -v 'grep' | awk '{print $2}' | xargs kill -9

    #clean tiup data dir
    find "${TIUP_DATA_DIR}" -mindepth 1 -maxdepth 1 -type d -mmin -30 -regex '.*/[A-Z].*' -exec rm -rf {} \;

    # 等待一段时间
    sleep 2
done >> "$log_file"

# 打印版本检查结果
for final_result in "${results[@]}"; do
    echo "${final_result}"
done

echo "Regression detection among releases finished."
echo "Please check release summary result in log file: ${status_file}${log_file}"
echo "For more details, please check full log file: ${log_file}"