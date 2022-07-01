#ifndef HEADER_H
#define HEADER_H

struct adatok {
    char* sor;
    int elofordul;
};
typedef struct adatok adatok;

struct minden {
    int tombmerete;
    int count;
    adatok** tomb;
};
typedef struct minden minden;
//Ez nem működik sehogyse, akárhogy próbálom, a struktúra sor pointere nem jó.

void foFeladat(FILE *file);

#endif //HEADER_H
