use strict;
use warnings;
use JSON; # The `JSON` module is required only for this sample code.

require '../UnaDecoder.pm';

# Numeric data
my $data1 = UnaDecoder::decode('a421a601b051fd0053426027');
print encode_json($data1) . "\n"; # { hmd: 42.2, tmp: 25.3, prs: 1008 }

# Text data
my $data2 = UnaDecoder::decode('8013e569a0138c15c013f929', ['d1', 'd2', 'd3']);
print encode_json($data2) . "\n"; # { d1: 'zoe', d2: 'ell', d3: 'joy' }