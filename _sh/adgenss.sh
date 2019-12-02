#! /usr/bin/env bash
# _sh/adgenss.sh
# run adgens on all the asciidoc files
#_sh/adgens.sh


cd `dirname $0`/..

_sh/adgens.sh `for d in index.ad web editors formatting languages linux; do find $d -name '*.ad' ; done`

