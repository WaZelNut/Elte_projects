#include <iostream>
#include <vector>
#include "leggyakoribb.hpp"

int main(int argc, char *argv[]){
    Status st;
    int e;
    Leggyakoribb x(argv[1]);
    std::vector<Adatok> list;
    x.read(e, st);
    while (st == norm) {
        unsigned int i = 0;
        for (i = 0; i < list.size(); i++) {
            if (e == list.at(i).szam) {
                list.at(i).mennyiseg++;
                break;
            }
        }
        if (i >= list.size()) {
            list.push_back({e,1});
        }
        x.read(e, st);
    }

    int legtobb = list.at(0).mennyiseg;
    int index = 0;
    for ( unsigned int i = 1; i < list.size(); i++) {
        if (legtobb < list.at(i).mennyiseg) {
            index = i;
        }        
    }

    std::cout << list.at(index).szam << " " << list.at(index).mennyiseg << std::endl;

    return 0;
}