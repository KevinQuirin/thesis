#!/bin/bash
branch=master
if [ `git rev-parse - abbrev-ref HEAD` == "$branch" ]; then
    latexmk -pdf main.tex
    pdflatex main.tex | grep -i -f errors.grep > errors.log
    
    git checkout gh-pages
    git rm main.pdf
    git rm errors.log
    git checkout $branch -- main.pdf
    git checkout $branch -- errors.log
    git add -A
    git commit -a -m "Autocommit $(date +"%d.%m.%Y %H:%M:%S")"
    git push
    git checkout master
fi

exit 0
