#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void reverse(char *array);

void feladat(FILE *stream){
   char buffer[1024];
   int length;
   char* p;
   char** arr;
   arr = 0;
   int arrCapacity = 0;
   //int novelo = 3;
   int count = 0;
   while (fgets(buffer, 1024, stream)){
      length = strlen(buffer) + 1;
      if (count >= arrCapacity) {
	//arrCapacity += novelo;
	arrCapacity = arrCapacity*2+1;
        arr = (char **)realloc(arr, arrCapacity * sizeof(char *));
        if (arr == NULL){
	  fprintf(stderr, "Memory allocation failed!");
        }
      }
      p = (char *)malloc(length * sizeof(char));

      if (NULL == p){
         printf("Memory allocation failed!");
	 exit (1);
      }



      for (int i = 0; i < length; i++){
         p[i] = buffer[i];
      }

      reverse(p);

      arr[count] = p;
      count++;
   }

   int szamlalo = 1;
   for (int i = count-1; i >= 0; i--){
	printf("%d %s", i+1, arr[i]);
	free(arr[i]);
	szamlalo++;
   }

   free(arr);
   
}


void reverse(char *array){
	char *array_end = array + strlen(array) - 2;

	while (array < array_end){
		char temp = *array_end;
		*array_end = *array;
		*array = temp;

		array++;
		array_end--;
	}
	
}
