#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
. $dir/cmake_config.sh

if [ -z "$SAM" ]; then
	echo "SAM ENV VAR NOT FOUND"
	exit 1
else
	# Check if leftover files exist
	cache=( "CMakeFiles" 
		"lib" 
		"UTIL" 
		"CMakeCache.txt" 
		"include_fortran" 
		"Makefile" 
		"SAM_CMAKE" 
		"cmake_install.cmake" )
	for file in "${cache[@]}"
	do
		if [ -e $file ]; then 
			rm -rf $file
		fi
	done
	echo "Removed leftover files, restarting..."

	cmake $SAM
	make
fi
