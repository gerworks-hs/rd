CC ?= gcc

all:
	$(CC) -Wall -o ./rd ./src/main.c
clean:
	rm -rfv ./rd