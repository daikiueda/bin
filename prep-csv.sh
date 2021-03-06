#!/bin/sh

# sedのエラー回避
LANG=C

# ヘッダー行はそのまま出力
head -n 1 $1

# 2行目以降について、値をすべてエクセルが文字列として扱うようにする
# trコマンドはWindows由来のCSVファイルで意図しない改行が発生する事象の回避策
tail -n +2 $1 | tr -d \\r | sed -e 's/^/="/g' -e 's/$/"/g' -e 's/,/",="/g'
