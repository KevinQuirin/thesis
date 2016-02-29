#!/bin/bash

latexmk -pdf main.tex
pdflatex main.tex | grep -i -f errors.grep > errors.log

git checkout gh-pages
git commit -a -m "Autocommit"
git push
git checkout master

exit 0
