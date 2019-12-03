#! /usr/bin/env bash
# clean the docs folder

cd `dirname $0`/../docs
rm index.html
for d in editors formatting languages web linux ; do 
    find $d -name '*.html' | while read dfe; do rm $dfe; done
done


