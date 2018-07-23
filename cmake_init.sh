#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
. $dir/cmake_config.sh

cp -a $SAM/$CASE .
cp -a $SAM/CaseName .

mkdir -p RESTART
mkdir -p OUT_3D
mkdir -p OUT_STAT

echo "Copied settings from $SAM"

cmake $SAM
if [ $? -eq 0 ]; then
	make
else 
	echo CMAKE FAIL
fi
