#!/usr/bin/env sh

# 發生錯誤時執行終止指令
set -e

# 打包編譯
npm run build

# 移動到打包資料夾下
cd dist

# 初始化新的 git 倉庫
git init

# 添加 .nojekyll 文件以防止 Jekyll 處理
touch .nojekyll

git add -A
git commit -m 'deploy'

# 使用 HTTPS 推送到 gh-pages 分支
git push -f https://github.com/yuch3nchen/vue-notepad.git main:gh-pages

cd -

# 此指令取自於 https://israynotarray.com/vue/20200214/1055437216/ ，感謝 Ray 的分享！