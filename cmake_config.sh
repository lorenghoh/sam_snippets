#!/bin/bash
# Compilers
export CC=gcc
export CXX=g++
export FC=mpifort

# Restore modules
module restore

# SAM_CMAKE source location
export SAM="/home/gunho/SAM"
export CASE="BOMEX"
