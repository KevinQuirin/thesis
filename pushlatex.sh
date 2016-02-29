#!/bin/bash
branch=master
if [ `git rev-parse --abbrev-ref HEAD` == "$branch" ]; then
    latexmk -pdf main.tex
    pdflatex main.tex | grep -i -f errors.grep > errors.txt
    cp main.pdf ../thesis-gh-pages/thesis/main.pdf
    cp errors.txt ../thesis-gh-pages/thesis/errors.txt
    cd ../thesis-gh-pages/thesis/
    git commit main.pdf errors.txt -m "Autocommit $(date +"%d.%m.%Y %H:%M:%S")"
    git push
    cd ../../thesis
fi

exit 0
