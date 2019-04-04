#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
. $dir/cmake_config.sh

if [ -z "$SAM" ]; then
	echo "SAM ENV VAR NOT FOUND"
	exit 1
else
	# Check if leftover files exist
	cache=( "CMakeCache.txt"
		"CMakeFiles" 
		"cmake_install.cmake"
		"include_fortran" 
		"lib"
		"Makefile" 
		"RUNDATA"
		"SAM_CMAKE" 
		"UTIL"
		"OUT_STAT"
		"OUT_3D"
		"RESTART")
	for file in "${cache[@]}"
	do
		if [ -e $file ]; then 
			rm -rf $file
		fi
	done
	echo "Removed leftover files, restarting..."

	mkdir -p RESTART
	mkdir -p OUT_3D
	mkdir -p OUT_STAT

	cmake $SAM
	make
fi
