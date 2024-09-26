CC ?= gcc
WINCC = x86_64-w64-mingw32-gcc
STRIP = strip --strip-all

debug:
	$(CC) $(CCFLAGS) -Wall -o ./rd.elf -g ./src/main.c
release-gnu-linux:
	$(CC) $(CCFLAGS) -Wall -o ./rd.elf -O3 ./src/main.c
	$(STRIP) ./rd.elf
release-windows:
	$(WINCC) $(CCFLAGS) -Wall -o ./rd.exe -O3 ./src/main.c
	$(STRIP) ./rd.exe
clean:
	rm -rfv ./rd.elf ./rd.exe