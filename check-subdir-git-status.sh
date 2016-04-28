#!/bin/sh

for dirname in $(ls -F | grep /); do
    ls "$dirname.git" 1> /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        echo $dirname
        cd $dirname
        git status -sb
        cd ..
    fi
done;
