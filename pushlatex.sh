#!/bin/bash
branch=master
if [ `git rev-parse --abbrev-ref HEAD` == "$branch" ]; then
    latexmk -pdf main.tex #compile the project if needed
    pdflatex main.tex | grep -i -f errors.grep > errors.txt #compile to catch the errors
    cp main.pdf ../thesis_page/thesis/main.pdf #copy the generated pdf to the gh-pages folder
    cp errors.txt ../thesis_page/thesis/errors.txt #copy the list of errors to the gh-pages folder
    cd ../thesis_page/thesis/ #go to the gh-pages folder
    sed -i.old -e 's#[0-9][0-9]*/[0-9][0-9]*/[0-9][0-9][0-9][0-9][ ]@[ ][0-9][0-9]*:[0-9][0-9]*#'$(date +%d/%m/%Y)' @ '$(date +%H:%M)'#g' index.html #change the date of update in index.html
    rm index.html.old #remove the old one FIXME
    git commit main.pdf errors.txt index.html -m "Autocommit $(date +"%d.%m.%Y %H:%M:%S")" #commit the changes
    git push #put the changes
    cd ../../thesis #go back to the .tex's folder
fi

exit 0
