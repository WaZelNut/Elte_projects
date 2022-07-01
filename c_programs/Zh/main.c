#include <stdio.h>
#include <stdlib.h>
#include "header.h"

int main(int argc, char* argv[]){
	FILE *file;
	if (argc > 1) {
		for (int i = 1; i < argc; i++) {
			file = fopen(argv[i], "r");

			if (file == NULL){
				fprintf(stderr, "Nem sikerült megnyitnod a filet!\n");
				continue;
			}
			foFeladat(file);
			fclose(file);
		}
	}
	else {
	   file = stdin;
	   foFeladat(file);
	}	
	return 0;
}

// Ez a nem jó structos kód
// void foFeladat(FILE *stream) {
//     adatok* arr;
//     char belerak[1023];
//     int kapacitas = 4;
//     int szamlalo = 0;

//     arr->sor = NULL; //(char**)malloc(4 * (char*));

//     while (fgets(belerak,1023,stream) != NULL) {   //Ha van még beolvasandó sor
//             if (szamlalo >= kapacitas) {    //Ha már nem fér bele több elem
//                 kapacitas += kapacitas*2;   //Megnöveljük
//                 arr->sor = (char**)realloc(arr->sor, kapacitas * sizeof(char*));
//                 if (arr->sor == NULL) {  //sikertelen allocolás
//                     fprintf(stderr, "A realloc sikertelen lett!");
//                     break;
//                 }    
//             }
//             arr->sor[szamlalo] = belerak;
//             szamlalo++;
//             printf("%d erteke", szamlalo);
//     }
// }
