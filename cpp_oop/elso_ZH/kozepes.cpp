#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <cmath>

enum Status {
    norm,
    abnorm
};

struct Megfigyeles {
    std::string datum;
    int becsles;
    int ossz;
};

class Reader {
    std::ifstream f;

    public:
    Reader(const char *path) : f(path)
    {
        if (!f)
        {
            throw std::invalid_argument("file not found");
        }
    }

    void read(Status &st, Megfigyeles &megfigyel) {
        std::string line;
        std::getline(f, line);
        std::stringstream ss(line);

        ss >> megfigyel.datum;
        ss >> megfigyel.becsles;
        megfigyel.ossz = 0;

        std::string dummyEgy;
        std::string dummyKetto;
        int ossz;

        while(ss >> dummyEgy >> dummyKetto >> ossz) {
            megfigyel.ossz += ossz;
        }

        st = f ? norm : abnorm;
    }
};

int main() {

    Status st = abnorm;
    Megfigyeles megfigyel;
    Reader x("inp.txt");
    bool l = true;
    int max = 0;
    int kul = 0;
    x.read(st, megfigyel);

    while (st == norm) {

        l = l && megfigyel.becsles > megfigyel.ossz;
        kul = abs(megfigyel.ossz - megfigyel.becsles);
        if (kul > max) {
            max = kul;
        }
        x.read(st, megfigyel);
    }

    if (l == true) {
        std::cout << "Igaz " << max; 
    } else {
        std::cout << "Hamis " << max;
    }
    
    return 0;
}