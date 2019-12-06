#! /usr/bin/env bash
# _sh/rmugens.sh
# run rmugen.sh on all the filename argruments.
# the rimu files are in _rmu
# and get compiled by rmugen.sh
# to . and docs

args=("$@")
d_sh=`dirname $0`
cd "$d_sh"/..
d0=`pwd`

i=0
n=${#args[*]}
while ((i<n))  ; do
    rfe1="${args[$i]}"
    if [ -f _rmu/$rfe1 ] ; then
        _sh/rmugen.sh $rfe1
        if [ $? -gt 0 ] ; then break; fi
    else
        echo no file: _rmu/$rfe1; fi
    ((i++))
done
exit $?

