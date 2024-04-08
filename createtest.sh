#!/bin/bash
# 2024-03-04 by kennedy8312

# Check if the number of input parameters is two
if [ "$#" -ne 2 ]; then
  echo "Error: Two input parameters are required."
  echo "Usage: $0 <source> <issue#>"
  echo "Example: $0 issue 10000"
  exit 1
fi

# 获取两个输入参数
source="$1"
issue="$2"
name="${source}${issue}"

cd testcase

# Check if the target folder already exists
if [ -d "$name" ]; then
  echo "Error: The target folder ${name} already exists. Please check the content in folder testcase."
  exit 1
fi

# 复制名为 "example" 的文件夹并重命名为拼接后的字符串 "ab"
cp -r example $name

# 替换新文件夹中所有文件名中的 "example" 部分为 "ab"
for file in ./${name}/*example*; do
  # 获取文件名和扩展名
  filename=$(basename "$file")
  extension="${filename##*.}"

  # 替换文件名中的 "example" 部分为 "ab"
  new_filename="${filename//example/$name}"

  # 重命名文件
  mv "$file" "./$name/$new_filename"
done
# 替换 source+issue.config 文件中的 "source=" 和 "issue=" 行
sed -i '' "s/^source=.*/source=$source/" ./${name}/${name}.config
sed -i '' "s/^issue=.*/issue=$issue/" ./${name}/${name}.config

cd ..

sed -i '' "s/^source=.*/source=$source/" ./detect.config
sed -i '' "s/^issue=.*/issue=$issue/" ./detect.config