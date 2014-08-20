CocoaHeads Atlanta August 2014 Code Kata
========================================

Roman Numeral Converter
------------------------

This is my first complete attempt at converting integer values to Roman Numerals.

As far as I can tell this version supports decmial numbers betwen 1 and 3,999.

The converter is based on a subclass of NSFormatter and supports both "Long" and "Short" formats.

The "Long" format does not use "subtractive notation." For example "IIII" represents the number "4" rather than being shorted to "IV" notation.

I have included a fairly extensive set of unit tests. I would be very interested to know if anyone can find values that don't work properly.

There are some rough spots in the code so please feel free to fork and improve!

System Requirements
-------------------

* OS X Yosimite (beta)
* Xcode 6 (beta 5+)
