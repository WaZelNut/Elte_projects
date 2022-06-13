#if !defined(DIRECTORY_H)
#define DIRECTOR_H
#include <vector>
#include <iostream>
#include "FileSystemElement.h"
class File;

class Directory : public FileSystemElement {
    private:
        std::vector<File*> fileok;
        std::string d_name;
        std::vector<Directory*> mappak;
    public:
        Directory(std::string name) : d_name(name) {}
        ~Directory() {
        }
        Directory* Search(std::string dolog_neve, Directory* mappaKer);
        void pushIt(std::string dolog_neve, int micsoda);
        void Kiir(Directory* mappa, int szint);
        void deleteAll(Directory* mappa);
        std::string getDNAME() {
            return d_name;
        }
        std::vector<Directory*> getMappak() {
            return mappak;
        }

        std::vector<File*> getFileok() {
            return fileok;
        }
};
#endif //DIRECTORY_H
