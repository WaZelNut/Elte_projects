#include <stdio.h>
#include <stdlib.h>
#include "header.h"

int main(void){
	ParityArray* adat = NULL;
	adat = initParityArray(adat);

	insertToParityArray(adat, 2);
	printParityArray(adat);
	insertToParityArray(adat, 4);
	printParityArray(adat);
	insertToParityArray(adat, 9);
	printParityArray(adat);
	insertToParityArray(adat, 2);
	printParityArray(adat);
	insertToParityArray(adat, 11);
	printParityArray(adat);
	free(adat);
	return 0;
}
