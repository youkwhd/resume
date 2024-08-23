#!/usr/bin/sh

./bin/gen-resume.pl $@ | pdflatex --jobname=resume
