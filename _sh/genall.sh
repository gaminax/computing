#!/bin/bash
# genall.sh

d_sh=`dirname $0`; base=$d_sh/..; cd $base

mkdir docs
cp -pr _includes docs
_sh/genadall.sh
_sh/genrimuall.sh

