#! /usr/bin/env bash
# _sh/adgens.sh
# run adgens on all the filename arguments

args=("$@")
echo \# = "$#" wd0=`pwd`
d_sh=`dirname $0`
cd "$d_sh"; cd ..
d0=`pwd`

echo args[0]=${args[0]}
i=0
n=${#args[*]}
echo n=$n
while ((i<n))  ; do
    echo i=$i, arg=${args[$i]}
    _sh/adgen.sh . docs "${args[$i]}"
    if [ $? -gt 0 ] ; then break; fi
    ((i++))
done
exit $?

