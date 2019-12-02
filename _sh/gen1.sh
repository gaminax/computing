#! /usr/bin/env bash
# _sh/gen1.sh
# Nov 24th.

# asciidoc to GFM md.
# Generate a relative web site entry in GFM md format
# from an `asciidoc -s` dfe

# The path of the second argument is either absolut from the base
# or relative to the current directory
# or relative to the Documents/Computing directory, in which case the file is first copied to the _pre and then generated.

# The output is:
#    a minor html header ( links )
#    the asciidoc output
#    a minor html footer ( created by ... )
# This embedding method enables Jekyll to wrap its headers
# and footers around the content as part of the Jekyll context.

argN=$#
arg0=$0
sarg1=$1
arg1=${sarg1#/}
if [ $argN -eq 0 ] ; then $arg0: echo no arg; exit 1; fi
pfe1=${arg1#/} # remove leading /

larrow="&#x2b05;"
rarrow="&#x27a1;"
nbsp="&nbsp;"

# The base directory is the parent directory of the _sh directory
# from which the script is run.
d0=`pwd`
d_sh=`dirname $0`; base=$d_sh/..; cd $base
base=`pwd`; d_sh=$base/_sh
# echo base=$base
# Expect this program to be in $base/_sh/gen.sh

# dfe="$base/_pre/$pfe1"
# if [ ! -f "$dfe" ] ; then echo no file; exit 1; fi
if [ -f ${base}/_pre/${arg1} ] ; then
    # the argument is an /absolute path from the base.
    dfe=${base}/_pre/${arg1}
    p=$arg1
    p=${p%/*}
    if [ "$p" = "$arg1" ] ; then p="/" ; fi
else
    echo $sarg1 not found; exit 1
fi
echo dfe=$dfe, p=$p

# remove short tail on rhs
df=${dfe%.*}
d=${dfe%/*}
# remove longest to slash on lhs
fe=${dfe##*/}
f=${fe%.*ts}

# File extension. remove long head
e=${dfe##*.}
# echo d=$d, fe=$fe, f=$f, e=$e

pfe2=${pfe1%.*}.md
dfe2=${base}/${pfe2}
d2=${dfe2%/+};

echo d2=$d2, e=$e
yyyy=`date +%Y`; mm=`date +%m`; dd=`date +%d`

# lines=(`cat "$dfe1"`)
export content=()

if [ "$e" = 'txt' -o "$e" = 'ad' ]
then
    # tail -n +6 $JOU/$DD.txt | asciidoc -s -
    # Read AsciiDoc header
    # Put 'page-' variables in yml header.
    declare -A yvars vars
    yv=0
    v=0

    {
    read h1 title
    while read cvarc val ; do
        if [ -z "$cvarc" ] ; then break; fi
        ch=${cvarc:0:1}
        if [ "$ch" != ":" ] ; then break; fi
        if [ ${cvarc:0:6} = ":page-" ]
        then yvars["$yv"]="${cvarc:6} $val"; ((yv=yv+1))
        else  vars["$v"]="${cvarc} $val"; ((v=v+1)); fi
    done
    # The asciidoc header has been read.
    while read line ; do content+=("$line") ; done
    if [ $? -ne 0 ] ; then echo file read error; exit 1; fi
    } <$dfe

    (
    # First output the yml header
    echo "---"
    echo "layout: default"
    echo "date: $yyyy-$mm-$dd"
    # echo "categories: [journal]"
    # echo "tags: [fonts, jekyll]"
    i=0
    while [ $i -lt $yv ] ; do
        echo "${yvars[$i]}"; ((i=i+1))
    done
    echo "---"
    # echo yml header is written

    # find links to paths
    # The links need to trail the pass over the path,
    # since the last folder is printed and not linked.
    # paths / p / q / qq
    echo "[Home/](/index.html)"
    # echo "[Computing/](/computing/index.html)"
    paths=""
    p="computing"
    sqq="$arg1"
    qq="${sqq#/}"
    while [ ! -z "$p" ] ; do
        q="${qq%%/*}" # find leading name
        if [ "$q" = "$qq" ] ; then break; fi
        # Capitalize first letter of dx
        L=`echo -n "${p:0:1}" | tr "[:lower:]" "[:upper:]"`
        P="$L${p:1}"
        # echo paths=$paths, p=$p, P=$P, L=$L, q=$q, qq=$qq, sqq=$sqq 1>&2
        echo "[${P}/]($paths/$p/index.html)"
        paths="$paths/$p"
        p="$q"
        qq="${qq#*/}" # remove leading name/
    done
    L=`echo -n "${p:0:1}" | tr "[:lower:]" "[:upper:]"`
    P=$L${p:1}
    echo "$P/"
    echo "<br>"
    ) >$dfe2

    # And now the asciidoc output
    (
    echo $h1 $title
    echo ":no title:"
    for (( i=0 ; i<v; i++ )) ; do
        echo "${vars[$i]}"; ((i=i+1))
    done
    echo
    echo

    n=${#content[@]}
    nn=0
    for ((i=0 ; i<n ; i++ )) ; do
        line="${content[i]}"
        # if [ "${line:0:9}" = 'include::' ] ; then echo ; else
        echo $line
        # fi
        ((++nn))
    done
    ) | tee $d/${f}_gen.$e | (cd "$d"; asciidoc -s -) | sed -e 's/{%/\&lcub;%/g' >>$dfe2
    (
    # And finally the footer
    echo
    echo "<br><br>"
    pgm=${arg0##*/}
    echo "<small>This GFM page created by $pgm on `date`.</small>"
    ) >>$dfe2

elif [ "$e" = '.rmu' ] ; then
    # Bash understands \ at the end of a line as a line continuation.
    # Need to double them first.
    sed 's#\\$#\\\\#' $dfe | tee $d/${f}_bsbs.txt | (
    dfe2=${dfe2%%.*}.html
    yvars=()
    read line
    eof=$?
    # touch $dfe2
    (
    if [ "$line" = "---" ] ; then
        # echo found yml header 1>&2
        echo $line
        echo "layout: post"
        echo "title: journal-$f"
        echo "date: $yyyy-$mm-$dd"
        while read line ; do
            echo $line
            yvars+=(line)
            if [ "$line" = "---" ] ; then break; fi
        done
        eof=$?
        if [ "$line" = "---" ] ; then eof=0; fi
        if [ $eof -gt 0 ] ; then echo no terminatng --- 1>&2; exit 1; fi
    else
        echo "---"
        echo "layout: default"
        echo "title: $f"
        echo "date: $yyyy-$mm-$dd"
        echo "---"
    fi
    ) >$dfe2
      (
      if [ "$line" != '---' ] ; then echo $line; fi
      while read line ; do echo $line ; done
      )  | rimuc >>$dfe2
    )
fi

# echo $nn / ${#content[@]} content lines.
# wc $dfe2
# echo yv=$yv
# echo v=$v
# for (( i=0 ; i<yv; i++ )) ; do
#     echo yvars[$i] = ${yvars[$i]}
# done

