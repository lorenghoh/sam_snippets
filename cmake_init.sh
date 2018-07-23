#!/bin/bash
export CC=mpicc
export CXX=mpicxx
export FC=mpifort

# Location of SAM to be built
SAM_DIR="/home/loh/SAM/"
CASE="BOMEX"

export SAM=$SAM_DIR

cp -a $SAM_DIR/$CASE .
cp -a $SAM_DIR/CaseName .

mkdir -p RESTART
mkdir -p OUT_3D
mkdir -p OUT_STAT

echo "Copied settings from $SAM_DIR"

cmake $SAM_DIR
if [ $? -eq 0 ]; then
	make
else 
	echo CMAKE FAIL
fi
