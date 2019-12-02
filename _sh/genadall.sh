#!/bin/bash
# genadall.sh

d0=`pwd`
d_sh=`dirname $0`
cd $d_sh
cd ..
echo pwd=`pwd`

( echo index.ad
echo README.ad
for d in editors formatting languages web _posts; do
    # echo $d 1>&2
    # echo $(find $d -name '*.ad' -print) 1>&2
    find $d -name '*.ad'
done
) |
( while read dfe ; do
    echo "$dfe"
    # echo _sh/genad.sh . docs "$dfe"
    _sh/genad.sh . docs "$dfe"
done
)

