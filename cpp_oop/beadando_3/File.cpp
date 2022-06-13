#include "File.h"


Directory* File::Search(std::string dolog_neve, Directory* mappaKer) {
    if (mappaKer->getDNAME() == dolog_neve) {
        return mappaKer;
    }
    Directory* result;
    for (unsigned int i = 0; i < mappaKer->getMappak().size(); i++) {
        result = Search(dolog_neve, mappaKer->getMappak().at(i));
    }
    return result;
}