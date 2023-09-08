#!/usr/bin/perl -I.

use warnings;
use strict;

use Switch;
use Template;
use File::Slurp;
use YAML::XS "LoadFile";

require "constants.pl";

my $nargs = $#ARGV + 1;

sub generate_and_print_resume ($) {
    my $tt = Template->new();
    my $data = LoadFile($_[0]);

    $tt->process(Constants->RESUME_TEMPLATE_FILENAME, $data, my $resume);
}

switch ($nargs) {
    case 1 {
        generate_and_print_resume 
            (($ARGV[0] eq "--example") ? 
                Constants->DATA_EXAMPLE_FILENAME : 
                Constants->DATA_FILENAME);
    }
    else {
        generate_and_print_resume
            Constants->DATA_FILENAME;
    }
}
