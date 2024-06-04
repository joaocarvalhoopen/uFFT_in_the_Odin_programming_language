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



// -----------------------------------------------------------------------------------
// dif

test_convolution_dif :: proc ( ) {

	N_a : int = 8
	N_b : int = 5

	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	vector_b : [ ^ ]complex64 = make( [^]complex64, N_b )
	if vector_b == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 2; n < N_b; n += 1 {
		vector_b[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}

	fmt.printfln( "\n vector_b - N_b %d\n", N_b )
	
	for n : int = 0; n < N_b; n += 1 {
		fmt.printf( "   vector_b n: %d   %f%+fi\n", n, real( vector_b[ n ] ), imag( vector_b[ n ] ) )
	}

	// Convolution!
	vector_res, N_c := dif.convolution( vector_a, N_a,  vector_b, N_b )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_b )
	free( vector_res )
}

test_cross_correlation_dif :: proc ( ) {

	N_a : int = 8
	N_b : int = 5

	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	vector_b : [ ^ ]complex64 = make( [^]complex64, N_b )
	if vector_b == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 2; n < N_b; n += 1 {
		vector_b[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}

	fmt.printfln( "\n vector_b - N_b %d\n", N_b )
	
	for n : int = 0; n < N_b; n += 1 {
		fmt.printf( "   vector_b n: %d   %f%+fi\n", n, real( vector_b[ n ] ), imag( vector_b[ n ] ) )
	}

	// Convolution!
	vector_res, N_c := dif.cross_correlation( vector_a, N_a,  vector_b, N_b )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_b )
	free( vector_res )
}

test_auto_correlation_dif :: proc ( ) {

	N_a : int = 8
	
	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < 4; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	for n : int = 4; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n - 4 ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}


	// Convolution!
	vector_res, N_c := dif.auto_correlation( vector_a, N_a )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_res )
}


// -----------------------------------------------------------------------------------
// dit

test_convolution_dit :: proc ( ) {

	N_a : int = 8
	N_b : int = 5

	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	vector_b : [ ^ ]complex64 = make( [^]complex64, N_b )
	if vector_b == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 2; n < N_b; n += 1 {
		vector_b[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}

	fmt.printfln( "\n vector_b - N_b %d\n", N_b )
	
	for n : int = 0; n < N_b; n += 1 {
		fmt.printf( "   vector_b n: %d   %f%+fi\n", n, real( vector_b[ n ] ), imag( vector_b[ n ] ) )
	}

	// Convolution!
	vector_res, N_c := dit.convolution( vector_a, N_a,  vector_b, N_b )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_b )
	free( vector_res )
}

test_cross_correlation_dit :: proc ( ) {

	N_a : int = 8
	N_b : int = 5

	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	vector_b : [ ^ ]complex64 = make( [^]complex64, N_b )
	if vector_b == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 2; n < N_b; n += 1 {
		vector_b[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}

	fmt.printfln( "\n vector_b - N_b %d\n", N_b )
	
	for n : int = 0; n < N_b; n += 1 {
		fmt.printf( "   vector_b n: %d   %f%+fi\n", n, real( vector_b[ n ] ), imag( vector_b[ n ] ) )
	}

	// Convolution!
	vector_res, N_c := dit.cross_correlation( vector_a, N_a,  vector_b, N_b )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_b )
	free( vector_res )
}

test_auto_correlation_dit :: proc ( ) {

	N_a : int = 8
	
	vector_a : [ ^ ]complex64 = make( [^]complex64, N_a )
	if vector_a == nil {
		fmt.println( "Error: failed to allocate memory for vector")
		os.exit( 1 )
	}

	for n : int = 0; n < 4; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n ), 0 )  )
	}

	for n : int = 4; n < N_a; n += 1 {
		vector_a[ n ] = complex64( complex ( f32( n - 4 ), 0 )  )
	}

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_a - N_a %d\n", N_a )

	for n : int = 0; n < N_a; n += 1 {
		fmt.printf( "   vector_a n: %d   %f%+fi\n", n, real( vector_a[ n ] ), imag( vector_a[ n ] ) )
	}


	// Convolution!
	vector_res, N_c := dit.auto_correlation( vector_a, N_a )

	fmt.printf( "\n in time domain:\n" )

	fmt.printfln( "\n vector_res - N_c %d\n", N_c )
	
	for n : int = 0; n < N_c; n += 1 {
		fmt.printf( "   vector_res n: %d   %f%+fi\n", n,  real( vector_res[ n ] ), imag( vector_res[ n ] ) )
	}

	free( vector_a )
	free( vector_res )
}



main :: proc ( ) {
    fmt.println( "Begin of example program for uFFT library.." )
    
	// FFT and IFFT
	
	fmt.println( "\n\n\n==> test_fft_and_ifft_dif( ) :\n" )
    test_fft_and_ifft_dif( )
    
	fmt.println( "\n\n\n==> test_fft_and_ifft_dit( ) :\n" )
    test_fft_and_ifft_dit( )

    
	// dif

	fmt.println( "\n\n\n==> test_convolution_dif( ) :\n" )
	test_convolution_dif( )

	fmt.println( "\n\n\n==> test_cross_correlation_dif( ) :\n" )
	test_cross_correlation_dif( )

	fmt.println( "\n\n\n==> test_auto_correlation_dif( ) :\n" )
	test_auto_correlation_dif( )

    
	// dit

	fmt.println( "\n\n\n==> test_convolution_dit( ) :\n" )
	test_convolution_dit( )

	fmt.println( "\n\n\n==> test_cross_correlation_dit( ) :\n" )
	test_cross_correlation_dit( )

	fmt.println( "\n\n\n==> test_auto_correlation_dit( ) :\n" )
	test_auto_correlation_dit( )


	fmt.println( "\n\n ...end!" )
}
