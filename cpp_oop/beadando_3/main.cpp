#include <iostream>
#include "File.h"

int main()
{
    int file_vagy_mappa;
    std::string dolog_neve;
    std::string letrehozando_nev;
    Directory *rendszer = new Directory("root");
    int meret = 0;
    while (std::cin >> file_vagy_mappa >> dolog_neve >> letrehozando_nev) {
        if (file_vagy_mappa == 0) {
            Directory* megtalalva = rendszer->Search(dolog_neve, rendszer);
            megtalalva->pushIt(letrehozando_nev, file_vagy_mappa);
            meret += 8;
        }
        else {
            Directory* megvan = rendszer->Search(dolog_neve, rendszer);
            megvan->pushIt(letrehozando_nev, file_vagy_mappa);
        }
    }
    rendszer->Kiir(rendszer, 0);
    std::cout << meret << "\n";
    rendszer->deleteAll(rendszer);
    delete rendszer;
    return 0;
}
