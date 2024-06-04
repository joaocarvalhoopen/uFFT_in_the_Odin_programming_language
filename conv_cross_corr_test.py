import numpy as np

# The vectors to be operated on.
a = np.array( [ 0, 1, 2, 3, 4, 5, 6, 7 ] )
b = np.array( [ 0, 0, 2, 3, 4])

c = np.array( [ 0, 1, 2, 3, 0, 1, 2, 3 ] )

# Test the convolution.
result = np.convolve( a, b, mode='full' )  # 'full' returns the full convolution

print( "The result of the convolution is", result )

# Test the cross_correlation.
result = np.correlate( a, b, mode='full' )  # 'full' returns the full correlation

print( "The result of the correlation is", result )

# Test the auto_correlation.
result = np.correlate( c, c, mode='full' )  # 'full' returns the full correlation

print( "The result of the auto-correlation is", result )

"""
The result of the convolution is      [ 0  0  0  2  7 16 25 34 43 52 45 28 ]

The result of the correlation is      [ 0  4 11 20 29 38 47 56 33 14  0  0 ]

The result of the auto-correlation is [ 0  3  8 14  8  9 16 28 16  9  8 14  8  3  0 ]
"""