#!/bin/bash

if [ $# != 1 ] ; then echo need a file argument ; exit 1; fi
rfe=$1
if [ ! -f "_rmu/$rfe" ] ; then echo no file: _rmu/$rfe; exit 1; fi
r=${rfe%/*}
if [ "$r" = "$rfe" ] ; then r="."; fi
fe=${rfe##*/}
f=${fe%.*}
e=${fe##*.}
echo rfe=$rfe, r=$r, f=$f, e=$e

cd `dirname $0`/..
d=`pwd`
rimuc -o  $r/$f.html _rmu/$rfe
cp -p $r/$f.html docs/$r
ls -l $r/$f.html docs/$r/$f.html

