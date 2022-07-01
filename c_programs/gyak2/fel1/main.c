#include <stdio.h>
#include <stdlib.h>

int main (void){
	int buffer;
	int *arr;
	int currentCapacity = 1;
	int extension = 1;
	int counter = 0;

	arr = (int *)malloc(currentCapacity * sizeof(int));
	if (arr == NULL){
	printf("No available memory\n");
	exit(1);
	}
	scanf("%d", &buffer);

	while (buffer > 0){
		arr[counter++] = buffer;

		if (counter >= currentCapacity - 1) {
			// Increase array
			currentCapacity += extension;
			arr= (int *)realloc(arr, currentCapacity * sizeof(int));
		}
		scanf("%d", &buffer);
	}
	/* output in reverse order */
	for (counter--; counter >= 0; counter--){
		printf("%d : %d\n", counter, arr[counter--]);
	}
	free(arr);
	
	return 0;
}
