#! /usr/bin/env bash
# clean the docs folder of files generated from asciidoc sources.

cd `dirname $0`/..
find . -name '*.ad' | while read dfe; do
    dfe2=${dfe%.ad}.html
    if [ -f docs/$dfe2 ] ; then
        rm docs/$dfe2
    fi
done 


