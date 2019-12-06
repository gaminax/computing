#! /usr/bin/env bash
# _sh/rmugenss.sh
# run rmugens on all the rimu files
#_sh/rmugens.sh


cd `dirname $0`/../_rmu

../_sh/rmugens.sh `for d in index.rmu web editors formatting languages linux; do if [ -d "$d" -o -f "$d" ]; then find $d -name '*.rmu' ; fi; done`


