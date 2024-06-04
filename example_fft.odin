/*
uFFT in Odin -  A port of the uFFT library to the Odin programming language.
Author of the port: João Carvalho
Data: 2024.06.01
License: MIT License

This library uses f32 and complex64 types from the Odin standard library.


Original author of uFFT library: David Barina

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

*/


package main

import dit "./uFFT_DIT"
import dif "./uFFT_DIF"

import "core:fmt"
import "core:math/cmplx"
import "core:os"


test_fft_and_ifft_dif :: proc ( ) {
	N : int = 1 << 3

	// float complex vector : [N];
    vector : [ ^ ]complex64 = make( [^]complex64, N )
    if vector == nil {
        fmt.println( "Error: failed to allocate memory for vector")
        os.exit( 1 )
    }

	for n : int = 0; n < N; n += 1 {
		vector[ n ] = complex64( f32( n ) )
	}

	fmt.printf( " in time domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

	dif.fft( vector, N )

	fmt.printf( "\n in frequency domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

	dif.ift( vector, N )

	fmt.printf( "\n in time domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

}

test_fft_and_ifft_dit :: proc ( ) {
	N : int = 1 << 3

	// float complex vector : [N];
    vector : [ ^ ]complex64 = make( [^]complex64, N )
    if vector == nil {
        fmt.println( "Error: failed to allocate memory for vector")
        os.exit( 1 )
    }

	for n : int = 0; n < N; n += 1 {
		vector[ n ] = complex64( f32( n ) )
	}

	fmt.printf( " in time domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

	dit.fft( vector, N )

	fmt.printf( "\n in frequency domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

	dit.ift( vector, N )

	fmt.printf( "\n in time domain:\n" )

	for n : int = 0; n < N; n += 1 {
		fmt.printf( "   %f%+fi\n", real( vector[ n ] ), imag( vector[ n ] ) )
	}

}

main :: proc ( ) {
    fmt.println( "Begin of example program for uFFT library.." )
    fmt.println( "\n\n\n==> test_fft_and_ifft_dif( ) :\n" )
    test_fft_and_ifft_dif()
    fmt.println( "\n\n\n==> test_fft_and_ifft_dit( ) :\n" )
    test_fft_and_ifft_dit()
    fmt.println( "\n\n ...end!" )
}
