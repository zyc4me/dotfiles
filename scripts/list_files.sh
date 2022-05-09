#!/bin/sh

# list all nv21 files, with natural sort order, and prepending specified prefix, write to txt

#PREFIX=`pwd`
PREFIX=/tmp/nfs/ld_testbed/LD_Test/test_image
for f in `ls -v *.nv21`;do echo $PREFIX/$f; done  > dir.txt 2>&1


