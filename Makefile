CC ?= gcc
CCFLAGS = -Wall -o ./rd

dev:
	$(CC) $(CCFLAGS) ./src/main.c
release:
	$(CC) $(CCFLAGS) -strip -O3 ./src/main.c
clean:
	rm -rfv ./rd