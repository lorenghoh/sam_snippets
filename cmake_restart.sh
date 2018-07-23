#!/bin/bash

set -e

if [ -z "$SAM" ]; then
	echo "SAM ENV VAR NOT FOUND"
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
		"UTIL" )
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
