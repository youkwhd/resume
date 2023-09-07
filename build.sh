#!/usr/bin/sh

file_check_or_exit() {
    local filename="$1"

    if [ ! -e $filename ]; then
        >&2 echo "ERROR: No $filename found."
        exit 1
    fi
}

file_check_or_exit private-key

if [ ! -e data.public.yaml ]; then
    file_check_or_exit data.yaml
    ./bin/gen-data.pl --encrypt
fi

if [ ! -e data.yaml ]; then
    file_check_or_exit data.public.yaml
    ./bin/gen-data.pl --decrypt
fi

./bin/gen-resume.pl | pdflatex --jobname=resume
