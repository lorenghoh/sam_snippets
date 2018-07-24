#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
. $dir/cmake_config.sh

if [ -z "$SAM" ]; then 
	echo "SAM dir not found"
	exit 1
fi

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
