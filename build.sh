#!/usr/bin/sh

perl -Mlib=. gen-resume.pl
pdflatex resume.tex
