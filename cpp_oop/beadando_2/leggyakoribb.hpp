#if !defined(LEGGYAKORIBB)
#define LEGGYAKORIBB
#include <fstream>

struct Adatok
{
    int szam, mennyiseg;
};

enum Status {
    norm,
    abnorm,
};


class Leggyakoribb {
    public:
        class FileOpenErrorException : std::exception {};

        Leggyakoribb(std::string fname) {
            f.open(fname.c_str());
            if(f.fail()) {
                throw new FileOpenErrorException;
            }
        }
    bool read(int &e, Status &st);
    private:
        std::ifstream f;
};

#endif // LEGGYAKORIBB
