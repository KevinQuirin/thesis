#!/bin/bash
branch=master
if [ `git rev-parse --abbrev-ref HEAD` == "$branch" ]; then
    latexmk -pdf main.tex
    pdflatex main.tex | grep -i -f errors.grep > errors.txt
    git checkout gh-pages
    git rm main.pdf
    git rm errors.txt
    git checkout $branch -- main.pdf
    git checkout $branch -- errors.txt
    git add main.pdf
    git add errors.log
    git commit -a -m "Autocommit $(date +"%d.%m.%Y %H:%M:%S")"
    git push
    git checkout $branch
fi

exit 0
