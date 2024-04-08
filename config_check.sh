#!/bin/bash

# Check if all configs are defined.
# 校验参数是否已定义
function check_parameters_defined() {
  echo "Checking parameter definitions from detec.config..."

  config_params=("source" "issue" "max_attempts" "REGRESSION_DETECT_ROOT" "TEST_SCRIPT_ROOT" "TIDB_LOC" "TIUP_DATA_DIR" "versions_minimum" "versions_master" "versions_v6_1" "versions_v6_5" "versions_v7_1" "versions_v7_5" "versions_patch_all" "versions" "versions_name" "DB_HOST" "DB_PORT" "DB_USER" "DB_NAME" "TEST_SCRIPT_LOC" "TEST_SCRIPT" "TEST_RESULT" "TEST_RUN" "TEST_CONFIG" "max_wait" "log_file" "status_file" "bisect_full_log" "bisect_log")

  for param_temp in "${config_params[@]}"; do
    if [ -z "${!param_temp}" ]; then
      echo "Error: Parameter '$param_temp' is not defined."
      exit 1
    fi
  done

  echo "All parameters are defined."
}

# Check if all defined files and directories exist.
# 校验文件和目录是否存在
function check_files_and_directories_exist() {
  echo "Checking file and directory existence..."

  config_files=("${TEST_SCRIPT}" "${TEST_RESULT}" "${TEST_RUN}" "${TEST_CONFIG}")
  config_dirs=("${REGRESSION_DETECT_ROOT}" "${TEST_SCRIPT_ROOT}" "${TIDB_LOC}" "${TIUP_DATA_DIR}" "${TEST_SCRIPT_LOC}")

  for file_temp in "${config_files[@]}"; do
    if [ ! -f "$file_temp" ]; then
      echo "Error: File '${file_temp}' does not exist."
      echo "Exiting.Please make recheck the defined files and rerun."
      exit 1
    fi
  done

  for dir_temp in "${config_dirs[@]}"; do
    if [ ! -d "$dir_temp" ]; then
      echo "Error: Directory '${dir_temp}' does not exist."
      echo "Exiting.Please make recheck the defined directories and rerun."
      exit 1
    fi
  done

  echo "All files and directories in detect.config exist."
}

# 执行参数校验
check_parameters_defined

# 执行文件和目录存在校验
check_files_and_directories_exist