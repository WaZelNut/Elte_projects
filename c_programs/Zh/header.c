#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "header.h"

#define BUFFSIZE 1024

static void freeing(minden* tombos, int hossz);
static int tartalmazzae(minden* tombos, char* beolvas);
static void addLine(minden *tombos, char* beolvas);
static int compare(char *content, char *buffer);

void foFeladat(FILE *file){
    char beolvas[BUFFSIZE];
    minden* tombos = NULL;
    tombos = (minden*)malloc(sizeof(minden));
    tombos->tomb = NULL;
    tombos->tombmerete = 4;
    tombos->count = 0;
    tombos->tomb=(adatok**)malloc(tombos->tombmerete * sizeof(adatok*));
    // //beolvasás része
    while (1 == fscanf(file, "%s", beolvas)){
        if (tartalmazzae(tombos, beolvas) == 0) {
            addLine(tombos, beolvas);
        }
    } //Beolvasás vége

    for (int i = 0; i < tombos->count; i++) {
        printf("%s előfordult %d-szer\n", tombos->tomb[i]->sor, tombos->tomb[i]->elofordul);
    }

    freeing(tombos, tombos->count);
  
}

static int tartalmazzae(minden* tombos, char* beolvas) {
    for (int i = 0; i < tombos->count; i++) {
        if(compare(tombos->tomb[i]->sor, beolvas)) {
            (tombos->tomb[i]->elofordul)++;
            return 1;
        }
    }
    return 0;
}

static void addLine(minden *tombos, char* beolvas) {

    if (tombos->count >= tombos->tombmerete) {
	    tombos->tombmerete = tombos->tombmerete*2;
        tombos->tomb=(adatok**)realloc(tombos->tomb, tombos->tombmerete * sizeof(adatok*));
        if (tombos->tomb == NULL){
            fprintf(stderr, "Nem sikerült memóriát lefoglalni");
        }
    }

    int length = strlen(beolvas);
    tombos->tomb[tombos->count] = (adatok*)malloc(sizeof(adatok));
    char *newString = (char *)malloc((length+1) * sizeof(char));  
    strcpy(newString, beolvas);
    newString[length] = '\0';
    tombos->tomb[tombos->count]->sor = newString;
    tombos->tomb[tombos->count]->elofordul = 1;
    tombos->count++;
}

static int compare(char *sor, char *beolvas){

    int len1 = strlen(sor);
    int len2 = strlen(beolvas);
    if (len1 == len2){
        for (int i = 0; i < len1; i++){
            char c1 = sor[i];
            char c2 = beolvas[i];
            if (c1 >= 'A' && c1 <= 'Z'){
                /* converting c1 to lower case */
                c1 = c1 + 'a' - 'A';
            }
            if (c2 >= 'A' && c2 <= 'Z'){
                /* converting c2 to lower case */
                c2 = c2 + 'a' - 'A';
            }
            if (c1 != c2){
                /* if they are not the same then returning false */
                return 0;
            }
        }
    }else{
        /* since length are not the same they can not be the same */
        return 0;
    }
    return 1;
}

static void freeing(minden* tombos, int hossz) {
    for (int i = 0; i < hossz; i++) {
        free(tombos->tomb[i]->sor);
    }
    free(tombos->tomb);
    free(tombos);
}


