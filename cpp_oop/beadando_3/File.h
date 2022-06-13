#if !defined(FILE_H)
#define FILE_H
#include "Directory.h"

class File : public FileSystemElement {
    private:
        std::string f_name;
    public:
        File(std::string name) : f_name(name) {}
        Directory* Search(std::string dolog_neve, Directory* mappaKer);
        std::string getFNAME() {
            return f_name;
        }
        

};


#endif //FILE_H