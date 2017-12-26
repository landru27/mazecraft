#!/usr/bin/perl


use strict;
use Getopt::Std;
use JSON;
use Data::Dumper;

my(%optarg);
my($cycle, $thresholdA, $thresholdB, $r);
my($linein, $lineout);
my(@blocks, $block, $indx);


## command line options
if (! getopts('c', \%optarg)) {
    print("$0: arg1 must be the cycle factor\n");
    exit(1);
}

$cycle = $ARGV[0];


while ($linein = <STDIN>) {
    chomp($linein);

    @blocks = split(/ /, $linein);
    $indx = 0;
    foreach $block (@blocks) {
        if ($block eq 'S') {
            $r = rand(4);
            $thresholdA += 1 / $cycle;
            if (sin($thresholdA) > $r) {
                $blocks[$indx] = '#';

                $r = rand(8);
                $thresholdB += 1 / $cycle;
                if (sin($thresholdB) > $r) {
                    $blocks[$indx] = '}';
                }
            }
        }
    $indx++;
    }
    $lineout = join(' ', @blocks);

    print(STDOUT "$lineout\n");
}
