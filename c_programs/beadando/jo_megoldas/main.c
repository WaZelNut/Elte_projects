#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "functions.h"

int main(int argc, char* argv[]){
	FILE *stream;
	if (argc > 1) {
		for (int i = 1; i < argc; i++) {
			stream = fopen(argv[i], "r");

			if (stream == NULL){
				fprintf(stderr, "File opening unsuccessful!");
				continue;
			}
			feladat(stream);

			fclose(stream);
		}
	}
	else {
	   stream = stdin;
	   feladat(stream);
	}	
	return 0;
}


