#!/bin/bash
# Compilers
export CC=icc
export FC=mpifort
export CXX=icpc

# SAM_CMAKE source location
SAM_DIR = "/home/gunho/SAM"
CASE = "BOMEX"

export SAM = $SAM_DIR
