#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void reverse(char* start);

int main(void) {
	char buffer[20];
	char* p;
	int length;
	scanf("%s", buffer);
	length = strlen(buffer)+1;
	p = (char *)malloc(length * sizeof(char));

	for (int i = 0; i < length; i++) {
		p[i] = buffer[i];
	}
	reverse(p);
	printf("%s\n", p);
	free(p);
	return 0;
}

void reverse(char* start) {
	char *end = start + strlen(start) -1; // \0 végett

	while(start < end) {
		//swap(start, end);
		char temp;
		temp = *end;
		*end = *start;
		*start = temp;
		start++;
		end--;
	}
}
