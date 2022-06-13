#include "File.h"

Directory* Directory::Search(std::string dolog_neve, Directory* mappaKer) {
    if (mappaKer->d_name == dolog_neve) {
        return mappaKer;
    }
    Directory* result = NULL;
    unsigned int i = 0;
    unsigned int h = mappaKer->mappak.size();
    while (result == NULL && i < h) {
        result = Search(dolog_neve, mappaKer->mappak.at(i));
        i++;
    }
    return result;
}

void Directory::pushIt(std::string dolog_neve, int micsoda) {
    if (micsoda == 0) {
        this->fileok.push_back(new File(dolog_neve));
    }
    else {
        this->mappak.push_back(new Directory(dolog_neve));
    }
}

void Directory::Kiir(Directory* mappa, int szint) {
    for (int i = 0; i < szint; i++) {
        std::cout << "    ";    
    }
    std::cout << mappa->d_name;
    std::cout << "\n";
        for (int h = 0; h < mappa->mappak.size(); h++) {
            Kiir(mappa->mappak.at(h), szint+1);
        }
        
        for (int j = 0; j < mappa->fileok.size(); j++) {
            std::cout << "    ";
            for (int i = 0; i < szint; i++) {
                std::cout << "    ";    
            }
            std::cout << mappa->fileok.at(j)->getFNAME() << "\n";
        }
}

void Directory::deleteAll(Directory* mappa) {
    for (int i = 0; i <mappa->mappak.size(); i++) {
        deleteAll(mappa->mappak.at(i));
    }

    for (int i = 0; i < mappa->fileok.size(); i++) {
        delete mappa->fileok.at(i);
    }

      for (int i = 0; i < mappa->mappak.size(); i++) {
        delete mappa->mappak.at(i);
    }
}
