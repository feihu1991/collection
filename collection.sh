#!/usr/bin/env bash
# collection.sh - 抓取文章并保存到 collection 仓库
# 用法: bash collection.sh <url>

set -e

REPO_DIR="/home/work/.openclaw/workspace/collection"
URL="$1"

if [ -z "$URL" ]; then
  echo "用法: bash collection.sh <url>"
  exit 1
fi

cd "$REPO_DIR"

# 生成日期文件夹
DATE=$(date +%Y-%m-%d)
mkdir -p "$DATE"

# 根据 URL 类型处理
if [[ "$URL" == *"zhihu.com"* ]]; then
  # 知乎文章
  echo "检测到知乎链接: $URL"
  # 实际抓取由 Claw 通过 web_fetch 完成，这里只是占位
  echo "ZHIHU:$URL" > "$DATE/.pending"
  
elif [[ "$URL" == *"mp.weixin.qq.com"* ]]; then
  # 微信公众号
  echo "检测到微信公众号链接: $URL"
  echo "WECHAT:$URL" > "$DATE/.pending"
  
else
  echo "不支持的链接类型: $URL"
  exit 1
fi

echo "已记录到 $DATE/.pending"
