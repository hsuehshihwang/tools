#!/bin/bash
file=${1:-sample.md}
output=${2:-${file%.md}.html}
# echo file=$file, output=$output
# npx markmap-cli@0.14 --no-open ${file}
[ -f $file ] && markmap --no-open ${file}
