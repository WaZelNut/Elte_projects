#include <iostream>
#include "complex.h"

void menuWrite();
void case0(complex &szam1);
void case1(complex &szam1);
void case2(complex &szam1);
void case3(complex &szam1);
void case4(complex &szam1);
void kiir(complex &szam1);


int main(){

    complex szam1(0,0);
    int v = 0;
    do{
        menuWrite();
        std::cin >> v;
        switch(v){
            case 0: case0(szam1); break;
            case 1: case1(szam1); break;
            case 2: case2(szam1); break;
            case 3: case3(szam1); break;
            case 4: case4(szam1); break;
        }
    }while(v != 5);

    return 0;
}

void menuWrite(){
    std::cerr << "0 - uj default szam\n";
    std::cerr << "1 - hozzaad\n";
    std::cerr << "2 - kivon\n";
    std::cerr << "3 - osszeszoroz\n";
    std::cerr << "4 - eloszt\n";
    std::cerr << "5 - kilep\n";

}
void case0(complex &szam1){
    std::cerr << "Mi legyen a default szam? ";
    double elso, masodik;
    std::cin >> elso >> masodik;
    szam1.setValos(elso);
    szam1.setKepzetes(masodik);
    if (szam1.kepzetes >= 0) {
        std::cerr << szam1.valos <<" + " << szam1.kepzetes << "i\n";
    }
    else {
        std::cerr << szam1.valos <<" - " << (-1)*szam1.kepzetes << "i\n";
    }
}

void case1(complex &szam1){
    std::cerr << "Uj komplex szamot kerek!";
    complex szam2(0,0);
    double elso, masodik;
    std::cin >> elso >> masodik;
    szam2.setValos(elso);
    szam2.setKepzetes(masodik);
    szam1 = szam1 + szam2;
    kiir(szam1);


}

void case2(complex &szam1){   
    std::cerr << "Uj komplex szamot kerek!";
    complex szam2(0,0);
    double elso, masodik;
    std::cin >> elso >> masodik;
    szam2.setValos(elso);
    szam2.setKepzetes(masodik);
    szam1 = szam1 - szam2;
    kiir(szam1);
}

void case3(complex &szam1){
    std::cerr << "Uj komplex szamot kerek!";
    complex szam2(0,0);
    double elso, masodik;
    std::cin >> elso >> masodik;
    szam2.setValos(elso);
    szam2.setKepzetes(masodik);
    szam1 = szam1 * szam2;
    kiir(szam1);
    
}

void case4(complex &szam1){
    std::cerr << "Uj komplex szamot kerek!";
    complex szam2(0,0);
    double elso, masodik;
    std::cin >> elso >> masodik;
    szam2.setValos(elso);
    szam2.setKepzetes(masodik);
    szam1 = szam1 / szam2;
    kiir(szam1);
    
}

void kiir(complex &szam1){
    if (szam1.kepzetes >= 0) {
        std::cout << szam1.valos <<" + " << szam1.kepzetes << "i\n";
    }
    else {
        std::cout << szam1.valos <<" - " << (-1)*szam1.kepzetes << "i\n";
    }
}