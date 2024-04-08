#!/bin/bash

# SQL脚本文件名
sql_file="insert_data.sql"

# 清空并创建SQL脚本文件
echo "" > "$sql_file"

# 循环生成插入语句
for ((i=1; i<=10000; i++))
do
  # 生成随机数据
  k=$((RANDOM % 10000))
  c=$(openssl rand -base64 90 | tr -dc 'a-zA-Z0-9' | head -c 120)
  pad=$(openssl rand -base64 45 | tr -dc 'a-zA-Z0-9' | head -c 60)

  # 拼接插入语句
  insert_query="INSERT INTO sbtest1 (k, c, pad) VALUES ($k, '$c', '$pad');"

  # 将插入语句追加到SQL脚本文件
  echo "$insert_query" >> "$sql_file"
done

echo "生成的SQL脚本已保存到 $sql_file"