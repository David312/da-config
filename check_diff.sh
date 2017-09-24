#!/bin/bash

RESULTS_DIR='/tmp/diff'


function diff_subdir {
    diff_files "$1"
}


function diff_files {
    for f in "$1"/.* # "$1"/*
    do
	BASE=`basename "$f"`
	if test "$BASE" != '.' -a "$BASE" != '..' -a "$BASE" != '.z'
	then
	    if test -d "$BASE"
	    then
		diff_subdir "$f"
	    fi
	
	    echo "$f:" >> "$RESULTS_DIR"
	    diff "$f" ~/"$f" >> "$RESULTS_DIR" 2> /dev/null
	fi
    done
}


function main {

    if test -e "$RESULTS_DIR"
    then
	rm "$RESULTS_DIR"
    fi

    diff_files '.'
    echo "Log file with differences saved in $RESULTS_DIR."
    exit 0
}

main
