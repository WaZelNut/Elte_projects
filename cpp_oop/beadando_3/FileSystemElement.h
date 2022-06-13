#if !defined(FILE_SYSTEM_ELEMENT_H)
#define FILE_SYSTEM_ELEMENT_H
#include <iostream>
class Directory;


class FileSystemElement
{
public:
    virtual ~FileSystemElement(){}
    virtual Directory* Search(std::string dolog_neve, Directory* mappaKer) = 0;
};

#endif //FILE_SYSTEM_ELEMENT_H