#!/bin/bash
let line=1+$1
echo "Selecting line $line from $2" 
# These are not working:
# ./parprint.sh `eval sed -n "${line}"p $2`
# ./parprint.sh "$parline"
# ./parprint.sh $parline

parline=`sed -n "${line}"p $2`
echo "Line content: $parline"
declare -a oldpar=("$@")
eval set -- "$1 $parline $2"
echo "New pars: $@"
./parprint.sh "$@"
#echo "Oldpars"
#./parprint.sh "${oldpar[@]}"
#set -- "${oldpar[@]}"
#./parprint.sh "$@"

# Arguments=myscript.R myout.${Process} paramfile.txt ${Process}
# R script, output file for that run, param file, run #
# line ${Process}+1 of paramfile.txt contains arguments
let line=1+$4
parline=`sed -n "${line}p" $3`
eval set -- "$1 $2 $parline"
Rscript "$@"

