#include <stdio.h>
#include "header.h"


struct ParityArray {
    int tomb[MAX_ARRAY_SIZE];
    int even_idx;
    int odd_idx;
};

void initParityArray(ParityArray* adat) {
	
	for (int i = 0; i < MAX_ARRAY_SIZE; i++){
		adat->tomb[i] = -1;
	}
	adat->even_idx = 0;
	adat->odd_idx = MAX_ARRAY_SIZE - 1;
}

int insertToParityArray(ParityArray* adat, int szam) {
	if (szam < 0 || adat->even_idx > adat->odd_idx) {
		return 1;
	}
	if (szam % 2 == 0) {
		adat->tomb[adat->even_idx] = szam;
		adat->even_idx = adat->even_idx + 1;
	}
	else {
		adat->tomb[adat->odd_idx] = szam;
		adat->odd_idx = adat->odd_idx - 1;
	}
	return 1;
}

void printParityArray(ParityArray* adat){
	
	
	for (int i = 0; i < MAX_ARRAY_SIZE; i++){
		if (adat->tomb[i] == -1) {
			//printf(" _ ");
		}
		else {
			printf(" %d ", adat->tomb[i]);
		}
	}	
	printf("\n");
}