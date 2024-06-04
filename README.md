# uFFT in the Odin programming language
A port of the uFFT library from C to the Odin programming language.

## Description
uFFT in Odin is a small portable Odin library for computing the discrete Fourier transform (DFT) in one dimension. <br>

It's a port of the original uFFT from C. <br>

Implements also Convolution, Cross-Correlation and Auto-Correlation. <br>

The library implements forward and inverse fast Fourier transform (FFT) algorithms using both decimation in time (DIT) and decimation in frequency (DIF). <br>

The library is written in pure C99. No compiler extensions nor assembly language are employed. It uses floating point data type and can handle unaligned data. <br>
The FFT routines can be easily modified since their source code has less than a hundred lines. As you might expect, the uFFT performance does not outperform the performance of FFTW. The library uses one temporary array as large as the input array. <br>

This library uses f32 and complex64 types from the Odin standard library.


## Original author of uFFT library 

David Barina <br>

Github xbarin02 - uFFT <br>
[https://github.com/xbarin02/uFFT](https://github.com/xbarin02/uFFT)


## License
MIT Open Source License

## Original license

```
MIT License

Copyright (c) 2017 David Barina

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

```

## Have fun!
Best regards, <br>
João Carvalho <br>

