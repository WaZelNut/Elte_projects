#include <stdio.h>
#include "header.h"

int main(void){
	int tomb[MAX_ARRAY_SIZE];

	for (int i = 0; i < MAX_ARRAY_SIZE; i++){
		tomb[i] = -1;
	}

	insertToParityArray(tomb, 2);
	printParityArray(tomb);
	insertToParityArray(tomb, 4);
	printParityArray(tomb);
	insertToParityArray(tomb, 9);
	printParityArray(tomb);
	insertToParityArray(tomb, 2);
	printParityArray(tomb);
	insertToParityArray(tomb, 11);
	printParityArray(tomb);
	return 0;
}
