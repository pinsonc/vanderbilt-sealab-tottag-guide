#!/bin/bash

#To use, run script with the file you want to convert as the argument. This will replace the text in the file,
#so if you want to keep the original as well, create a backup

lines=$(wc -l < $1)
echo $lines
for ((i = 2 ; i <= $lines ; i++));
do
    epoch=$(sed "${i}q;d" $1 | cut -c 1-10)
#    echo $epoch
    if [[ ${epoch::1} != "#" ]] # || [[ $epoch-ne#* ]]
    then
#	echo $i
	diff=$((epoch-last))
	if [ $diff -gt 120 ] || [ $diff -lt 0 ] && [ $i != 2 ]
	then
     	   echo Jump on line: $i, diff is: $diff
	fi
	last=$epoch
	d=$(date -u -d @"$epoch")
	sed -r -i "${i}s/([0-9]{10})/$d/g" $1
    fi
done
