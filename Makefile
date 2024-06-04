all:
	odin build . -out:example_fft.exe --debug
opti:
	odin build . -out:example_fft.exe -o:speed

clean:
	rm example_fft.exe

run:
	./example_fft.exe



