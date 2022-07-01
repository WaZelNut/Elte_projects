#include <stdio.h>
#include <stdlib.h>

int main (void) {
	char buffer[20];
	int length;
	scanf("%s", buffer);

	length = strlen(buffer) + 1;

	char *p;
	p = (char *)malloc(length * sizeof(char));
	
	for (int i = 0; i < length; i++) {
		p[i] = buffer[i];
		// *(p + i) = *(buffer + i) ugyanazt jelenti
	}
	printf("Length: %d\n", length)
	printf("%s\n", p);

	free(p);
	
	return 0;
}
