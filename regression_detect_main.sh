#!/bin/bash
# 2024-01-10 by kennedy8312

#load config parameters
source detect.config
#check config parameters
source config_check.sh

# Define "bad" and "good" commits
source $TEST_CONFIG
GOOD_COMMIT=$GOOD_COMMIT
BAD_COMMIT=$BAD_COMMIT

echo "Start to detect regression causing commit for ${source} ${issue}" 

echo "Start to detect regression causing commit for ${source} ${issue}" > ${bisect_log}
echo "Start to detect regression causing commit for ${source} ${issue}" > ${bisect_full_log}

# 定义变量数组
config_keys=("GOOD_COMMIT" "BAD_COMMIT" "TEST_RUN" "DB_HOST" "DB_PORT" "DB_USER" "DB_NAME" "TEST_SCRIPT" "TEST_RESULT" "TEST_SCRIPT_LOC" "TIDB_LOC" "max_attempts" "max_wait")
config_values=("${GOOD_COMMIT}" "${BAD_COMMIT}" "${TEST_RUN}" "${DB_HOST}" "${DB_PORT}" "${DB_USER}" "${DB_NAME}" "${TEST_SCRIPT}" "${TEST_RESULT}" "${TEST_SCRIPT_LOC}" "${TIDB_LOC}" "${max_attempts}" "${max_wait}") 

# 遍历数组
for (( i=0; i<${#config_values[@]}; i++ )); do
  if [[ -z ${config_values[i]} ]]; then
    echo "Loading config ${config_keys[i]} is empty"
    exit 1
  fi
done

cd ${TIDB_LOC}

git checkout -f master

# Start the Git Bisect process
git bisect start $BAD_COMMIT $GOOD_COMMIT 1>>${bisect_full_log} 2>&1
#skip a v6.2 commit which would cause tidb-server startup failure 
#need to provide the skip list for 50043, it would be hard to identify since the skip list was too long for 50043.

# Set the Git Bisect test command
git bisect run $TEST_RUN $DB_HOST $DB_PORT $DB_USER $DB_NAME $TEST_SCRIPT $TEST_RESULT $TEST_SCRIPT_LOC $TIDB_LOC $max_attempts $max_wait $bisect_log 1>>${bisect_full_log} 2>&1

git bisect log 1>>${bisect_log} 2>&1

# Exit Git Bisect and reset to the initial state
git bisect reset

echo "Regression detection finished."
echo "Please check bisect summary result in log file: ${bisect_log}"
echo "For more details, please check full log file: ${bisect_full_log}"