#!/usr/bin/perl


use strict;
use Getopt::Std;
use JSON;
use Data::Dumper;

my($linein, $lineout);
my($flagfirst, $linepadding);


$flagfirst = 1;
while ($linein = <STDIN>) {
    $lineout = $linein;

    chomp($lineout);

    $lineout .= '    ';

    $lineout =~ s/\+ - /S S S S /g;
    $lineout =~ s/\+   /S . . . /g;
    $lineout =~ s/\|   /S . . . /g;
    $lineout =~ s/\    / . . . ./g;

    $lineout = '^ ^ ' . $lineout;
    $lineout =~ s/[ .]*$//;
    $lineout = $lineout . ' ^ ^';

    if ($flagfirst == 1) {
        $linepadding = $lineout;
        $linepadding =~ s/[^ ]/^/g;
        print(STDOUT "$linepadding\n");
        print(STDOUT "$linepadding\n");

        $flagfirst = 0;
    }

    print(STDOUT "$lineout\n");

    if ($linein =~ /\|/) { print(STDOUT "$lineout\n$lineout\n"); }
}
print(STDOUT "$linepadding\n");
print(STDOUT "$linepadding\n");
