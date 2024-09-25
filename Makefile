CC ?= gcc
CCFLAGS = -Wall -o ./rd

dev:
	$(CC) $(CCFLAGS) -g ./src/main.c
release:
	$(CC) $(CCFLAGS) -O3 ./src/main.c
	strip --strip-all ./rd
clean:
	rm -rfv ./rd