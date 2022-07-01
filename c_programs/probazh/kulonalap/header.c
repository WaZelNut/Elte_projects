#include <stdio.h>
#include "header.h"

int insertToParityArray(int* tomb, int szam) {
	static int even_idx = 0;
	static int odd_idx = MAX_ARRAY_SIZE - 1;
	
	if (szam < 0 || even_idx > odd_idx) {
		return 1;
	}
	if (szam % 2 == 0) {
		tomb[even_idx] = szam;
		even_idx = even_idx+1;
	}
	else {
		tomb[odd_idx] = szam;
		odd_idx = odd_idx - 1;
	}
	return 1;
}

void printParityArray(int* tomb){
	
	
	for (int i = 0; i < MAX_ARRAY_SIZE; i++){
		if (tomb[i] == -1) {
			//printf(" _ ");
		}
		else {
			printf(" %d ", tomb[i]);
		}
	}	
	printf("\n");
}