# Thesis
Kevin Quirin's PhD thesis draft

You can see the compiled file on https://KevinQuirin.github.io/thesis

This repo is using a git pre-push hook. To use it:
* Create two folders, one for branch master, one for branch gh-pages
* Change pushlatex.sh as you need
* Write what you want to grep in errors.grep.
* In your master folder, run
    chmod +x pushlatex
    ln -s -f ../../pushlatex.sh .git/hooks/pre-push

The script does the following:
* Compile main.tex with latexmk
* Compite main.tex with pdflatex to grep the errors
* Copy main.pdf and errors.txt to folder gh-pages
* Go to gh-pages
* Commit main.pdf and errors.txt, then push
* Come back to master folder
* Push to master
