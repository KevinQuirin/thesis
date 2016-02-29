#!/bin/bash

latexmk -pdf main.tex
pdflatex main.tex | grep -i -f errors.grep > errors.log
cp main.pdf ~/Code/Tex/thesis_gh_pages/thesis/thesis.pdf
cp errors.log ~/Code/Tex/thesis_gh_pages/thesis/errors.log

git checkout gh-pages
git commit -a -m "Autocommit"
git push
git checkout master

