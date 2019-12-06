#! /usr/bin/env bash
# clean the docs and . folder of files generated from rmu sources.

cd `dirname $0`/../_rmu
find . -name '*.rmu' | while read dfe; do
    dfe2=${dfe%.rmu}.html
    # echo ../$dfe2
    if [ -f ../$dfe2 ] ; then
        rm ../$dfe2
    fi
    if [ -f ../docs/$dfe2 ] ; then
        rm ../docs/$dfe2
    fi
done 


