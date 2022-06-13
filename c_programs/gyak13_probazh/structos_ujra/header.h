#ifndef HEADER_H
#define HEADER_H

struct ParityArray;
typedef struct ParityArray ParityArray;

#define MAX_ARRAY_SIZE 5
ParityArray* initParityArray(ParityArray* adat);
int insertToParityArray(ParityArray* adat, int szam);
void printParityArray(ParityArray* adat);
#endif //HEADER_H
