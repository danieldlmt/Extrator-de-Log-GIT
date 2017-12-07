#!/bin/sh
revlist=$(git rev-list HEAD)
(
    for rev in $revlist
    do
            files=$(git log -1 --pretty="format:" --name-only --diff-filter=M $rev)
            for file in $files
            do
                    echo " $(git log -1 --pretty="%H;%ce;%ci" $rev);$file"
            done
    done
) > out.csv