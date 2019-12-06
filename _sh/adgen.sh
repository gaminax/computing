#!/bin/bash
# genad.sh d b rfe1
# generate asciidoc output in
#     d/b/r
#
# find . -name '*.ad' | while read dfe; do ./computing/genad.sh docs "$dfe"; done

function title {
    words="$1"
    W=`echo ${words:0:1}| tr "[:lower:]" "[:upper:]"`
    res="$W${words:1}"
    # echo res="$res" words="$words" 1>&2
    echo "$res"
}

# echo `title 'this is the way to the party'` 1>&2
d1="$1"
b="$2"
rfe1="$3"
argN=$#
args=("$@")
# print args:
# i=0; for arg in ${args[@]} ; do printf "%d %s\n" $i "${args[$i]}"; ((i++)); done

if [ $argN -eq 1 ] ; then # use defaults for locations
    rd=`dirname $0`
    cd $rd
    cd ..
    d=`pwd`
    # echo d=$d, rd=$rd
    if [ ! -d "$d" ]; then echo directory $d not found; exit 1; fi
    d1="." # use the current directory, found from location of script
    b=docs # use the docs directory
    rfe1="${args[0]}"
    # echo d=$d, rd=$rd, b=$b, d1=$d1
elif [ $argN -ne 3 ] ; then
    echo need 3 args
    exit 1
fi
e1="${rfe1##*.}"
r="${rfe1%/*}"
# echo r="$r", rfe1="$rfe1" 1>&2
if [ "$r" = "${rfe1}" ] ; then
    r="."
fi

rf="${rfe1%.*}"
e2="html"
rfe2="$rf.$e2"
# echo e1=$e1, e2=$e2

fe1="${rfe1##*/}"
f="${fe1%.*}"
# echo f=$f 1>&2
drfe1=$d1/$rfe1
drf=$d1/$rf
if [ ! -f $drfe1 ] ; then echo no input file pwd=`pwd`, drfe1="$drfe1"; exit 1; fi 
dbrfe2=$d1/$b/$rfe2

echo $dbrfe2 1>&2

# echo drfe1=$drfe1, dbrfe2=$dbrfe2,d1/b/r=$d1/$b/$r 

mkdir -p "$d1/$b/$r"
if [ $? -gt 0 ] ; then
    echo cannot mkdir $d1/$b/$r 1>&2; exit 1
fi


# stack the path for use in headers
pp=(home computing)
npp=2
parents="../"
q="$rfe1"
p="${q%%/*}"
while [ "$p" != "$q" ]; do
    #echo p="$p", q="$q", push p="$p"
    pp+=("$p")
    q="${q#*/}"
    p="${q%%/*}"
    parents+="../"
    ((npp++))
done

yyyy=`date +%Y`; mm=`date +%m`; dd=`date +%d`

IFS="\n"
vars=()


cat "$drfe1" | {
read h

# read in the asciidoc macros
nv=0
while IFS= read line1; do
    if [ "${line1:0:1}" != ":" ] ; then break; fi
    vars+=("$line1")
    ((nv++))
    # printf "%s\n" "$line1"
done
# line1 is the first line after the macros

nv2=${#vars[*]}
if [ $nv2 -ne $nv ] ; then echo nv=$nv, nv2=$nv2; exit 1; fi
( # output the yml header
  echo "---"
  echo "layout: default"
  echo "date: $yyyy-$mm-$dd"
  i=0;
  # promote "page-" variables to yml header.
  while [ $i -lt $nv ] ; do
      line="${vars[$i]}"
      # echo "<$line>" 1>&2
      if [ "${line:0:6}" = ":page-" ] ; then printf "${line:6}\n"; fi
      ((i++))
  done
  cd "$d1" ; 
  echo "---"
) >"$dbrfe2"

# print all the variables
  printf "$h\n"
  i=0
  while [ $i -lt $nv ] ; do
      line="${vars[$i]}"
      # if [ ${line:0:6} != ":page-" ] ; then echo ${line}; fi
      printf "$line\n" # no need to delete promoted macro variables.
      ((i++))
  done

# Insert the path links.
# having problems with Bash - getting the value out of the (list).
# use indexed arrays instead.
printf "\n"
n=${#pp[@]};
# echo npp=$npp, n=$n, pp="${pp[*]}" 1>&2
# echo fe1="$fe1" 1>&2
if [ "$fe1" = "index.ad" ]; then ((--n)); fi
i=0
while [ $i -lt $n ] ; do
    p="${pp[$i]}"
    # echo i=$i, p="$p" 1>&2
    P=`echo ${p:0:1}| tr "[:lower:]" "[:upper:]"`
    ath=${p:1}
    Path="$P$ath"
    printf "[small]#link:${parents}index.html[$Path/]#\n"
    parents=${parents#*/}
    ((i++))
done

# echo r="$r" 1>&2
if [ "$r" = "." ]; then rLast=computing;
else rLast="${r##*/}"; fi
RLast=`title "$rLast"`
RLastSlash="$RLast/"
# echo rLast="$rLast" RLast="$RLast" RLastSlash="$RLastSlash" 1>&2
if [ "$fe1" = "index.ad" ] ; then printf "[small]#$RLastSlash#\n" ; fi
( cd "$r"
  sep=""
  for rr in * ; do if [ -d "$rr" ]; then
      if [ ${rr:0:1} = "_" ] ; then continue; fi
      if [ "$rr" = assets ] ; then continue; fi
      if [ "$rr" = docs ] ; then continue; fi
      Rr=`title "$rr"`
      # echo rr="$rr", Rr="$Rr" 1>&2
      printf "%s%s" "$sep" "[small]#link:$rr[$Rr]#"
      sep=", "
    fi
  done
)
# echo +
# echo r=$r, rlast=$rlast

# now start printing the asciidoc
# this is the last line read in at the beginning, the one ending the macros
# printf "line1=%s\n" "$line1"
# if [ ! -z "$line" ] ; then
    printf "%s\n" "$line1"
#fi

while IFS=  read -r line; do
    printf "%s\n" "$line"
done
} |  tee "_pre/${f}_gen.ad" | asciidoctor -s - >>"$dbrfe2"
# echo d1="$d1", dbrfe2="$dbrfe2" 1>&2
# | tee foo.txt 
# cat foo2.txt > "$dbrfe2"
# | tee "${drf}_gen.$e1"
# echo dbrfe2="$dbrfe2"
