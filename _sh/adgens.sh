#! /usr/bin/env bash
# _sh/adgens.sh
# run adgens on all the filename arguments,
# assuming that the base is the parent of adgens.

args=("$@")
# echo \# = "$#" wd0=`pwd`
d_sh=`dirname $0`
cd "$d_sh"/..
d0=`pwd`

# echo args[0]=${args[0]}
i=0
n=${#args[*]}
# echo n=$n
while ((i<n))  ; do
    # echo i=$i, arg=${args[$i]}
    dfe1="${args[$i]}"
    if [ -f $dfe1 ] ; then
        _sh/adgen.sh . docs $dfe1
        if [ $? -gt 0 ] ; then break; fi
    else
        echo no file: $dfe1; fi
    ((i++))
done
exit $?

