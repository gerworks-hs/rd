#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include "../include/rd.h"

void read_file(int fd) {
	char buffer[20];
	for (;;) {
		int bytes_read = read(fd, buffer, (sizeof(buffer) - 1));
		switch (bytes_read) {
			case 0:
				fprintf(stdout, "\n-> EOF Reached <-\n");
				break;
			case -1:
				fprintf(stderr, "I/O Error");
				perror("read()");
				break;
			default:
				buffer[bytes_read] = '\0';
				fprintf(stdout, "%s", buffer);
				continue;
		}
		break;
	}
	close(fd);
}

int main(int argc, char **argv) {
	fprintf(stdout, "rd - %s\n", VERSION);
	fprintf(stdout, "Made by Gerworks-HS (itsgerliz)\n\n");

	if (argc < 2) {
		fprintf(stderr, "Usage: %s <file paths> ...\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	for (int i = 1; i < argc; i++) {
		int file_fd = open(argv[i], O_RDONLY);

		if (file_fd < 0) {
			fprintf(stderr, "Cannot open <%s>\n", argv[i]);
			perror("open()");
			continue;
		}

		fprintf(stdout, "Reading file <%s>\n\n", argv[i]);

		read_file(file_fd);
	}

	exit(EXIT_SUCCESS);
}