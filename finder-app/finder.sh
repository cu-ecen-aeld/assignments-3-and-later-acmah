#!/bin/sh

# 9) Write a shell script finder-app/finder.sh as described below:

# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr





# Example invocation:

#        finder.sh /tmp/aesd/assignment1 linux

# Exits with return value 1 error and print statements if any of the parameters above were not specified

if [ $# -lt 2 ]
then
    echo "Need 2 parameters. FILESDIR and SEARCHSTR."
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

if [ ! -d $FILESDIR ]
then
    echo "$FILESDIR is not a directory"
    exit 1
fi

# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).
NUM_FILES=$(grep -lr "$SEARCHSTR" $FILESDIR | wc -l)
MATCHING_LINES=$(grep -r "$SEARCHSTR" $FILESDIR | wc -l)
echo "The number of files are $NUM_FILES and the number of matching lines are $MATCHING_LINES"