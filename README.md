perl-una-decoder
===============

The perl-una-decoder is a Perl module which allows you to decode a structured message data sent by a [UnaBiz Arduino library](https://github.com/UnaBiz/unabiz-arduino) for [UnaShield](https://unabiz.github.io/unashield/) which is a SIGFOX transceiver module for Arduino.

If you are a JavaScript (node.js) programmer, you can use the [node-una-decoder](https://github.com/futomi/node-una-decoder).

## Dependencies

* Perl 5

---------------------------------------
## Table of Contents

* [Installation](#Installation)
* [Usage](#Usage)
* [Release Note](#Release-Note)
* [References](#References)
* [License](#License)

---------------------------------------
## <a id="Installation">Installation</a>

Download this module:

```
$ git clone https://github.com/futomi/perl-una-decoder.git
```

---------------------------------------
## <a id="Usage">Usage</a>

```perl
require './perl-una-decoder/UnaDecoder.pm';
use JSON; # The `JSON` module is required only for this sample code.

# Numeric data
my $data1 = UnaDecoder::decode('a421a601b051fd0053426027');
print encode_json($data1) . "\n"; # { hmd: 42.2, tmp: 25.3, prs: 1008 }

# Text data
my $data2 = UnaDecoder::decode('8013e569a0138c15c013f929', ['d1', 'd2', 'd3']);
print encode_json($data2) . "\n"; # { d1: 'zoe', d2: 'ell', d3: 'joy' }
```

That's it.

If the structured message data contains only numeric data, pass a hexadecimal string to the `UnaDecoder::decode()` method. The method will decode it and return the result as a hash reference. If the structured message data contains text data, pass an array reference to the `UnaDecoder::decode()` method as the 2nd argument. The array must contain the names representing text data.

---------------------------------------
## <a id="Release-Note">Release Note</a>

* v0.0.1 (2018-03-14)
  * First public release

---------------------------------------
## <a id="References">References</a>

* [UnaBiz](https://www.unabiz.com/)
* [UnaBiz Arduino library for connecting UnaShield to SIGFOX network](https://github.com/UnaBiz/unabiz-arduino)
* [UnaShield Developer Guide](https://unabiz.github.io/unashield/)
* [UnaShield Hardware Guide](https://unabiz.github.io/unashield/hardware.html)
* [UnaBiz - structuredMessage.js](https://github.com/UnaBiz/sigfox-gcloud/blob/master/decodeStructuredMessage/structuredMessage.js)

---------------------------------------
## <a id="License">License</a>

The MIT License (MIT)

Copyright (c) 2018 Futomi Hatano

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
