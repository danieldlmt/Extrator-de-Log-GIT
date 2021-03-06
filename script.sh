#!/bin/sh
revlist=$(git rev-list HEAD)
IFS=$'\n'
(
    for rev in $revlist
    do
            files=$(git log -1 --numstat --no-merges $rev | grep "^[0-9]")
            for file in $files
            do
                    echo " $(git log -1 --pretty="%H;%ce;%ci" $rev);$file"
            done
    done
) > out.csv
