CC ?= gcc
WINCC = x86_64-w64-mingw32-gcc
CCFLAGS = -Wall -o ./rd

dev:
	$(CC) $(CCFLAGS) -g ./src/main.c
release-gnu-linux:
	$(CC) $(CCFLAGS) -O3 ./src/main.c
	strip --strip-all ./rd
release-windows:
	$(WINCC) $(CCFLAGS) -O3 ./src/main.c
	strip --strip-all ./rd
clean:
	rm -rfv ./rd