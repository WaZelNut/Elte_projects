#ifndef HEADER_H
#define HEADER_H

#define MAX_ARRAY_SIZE 5
struct ParityArray;
typedef struct ParityArray ParityArray;

void initParityArray(ParityArray* adat);
int insertToParityArray(ParityArray* adat, int szam);
void printParityArray(ParityArray* adat);
#endif //HEADER_H