# ------------------------------------------------------------------
# perl-una-decoder - UnaDecoder.pm
#
# Copyright (c) 2018, Futomi Hatano, All rights reserved.
# Released under the MIT license
# Date: 2018-03-14
# ------------------------------------------------------------------
package UnaDecoder;
$VERSION = 0.01;
use strict;
use warnings;

sub decode {
	my($hex, $text_name_list) = @_;
	my $dbuf = pack("H*", $hex);
	my $dlen = length($dbuf);
	if($dlen == 0 || $dlen > 12 || $dlen % 4 != 0) {
		return;
	}
	my $res = {};
	for(my $i=0; $i<$dlen; $i+=4) {
		my($name) = unpack("S", substr($dbuf, $i, 2));
		$name = &_decodeText($name);
		my($value) = unpack("S", substr($dbuf, $i+2, 2));
		if(grep { $_ eq $name } @{$text_name_list}) {
			$value = &_decodeText($value);
		} else {
			$value = $value / 10;
		}
		$res->{$name} = $value;
	}
	return $res;
}

sub _decodeText {
	my($n) = @_;
	my @chars = (
		($n & 0b0111110000000000) >> 10,
		($n & 0b0000001111100000) >> 5,
		($n & 0b0000000000011111)
	);
	my $txt = '';
	my $code_offset = ord("a") - 1;
	for my $code (@chars) {
		if($code >= 1 && $code <= 26) {
			$txt .= chr($code_offset + $code);
		} elsif($code >= 27 && $code <= 36) {
			$txt .= ($code - 27);
		}
	}
	return $txt;
}

1;
