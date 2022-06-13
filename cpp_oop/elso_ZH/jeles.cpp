#include <fstream>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <string>
#include <cmath>
#include <limits.h>

enum Status {
    norm,
    abnorm
};

struct Megfigyeles {
    std::string datum;
    int becsles;
    int ossz;
    int antarktisz;
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
        megfigyel.antarktisz = 0;

        std::string dummyEgy;
        std::string ant;
        int ossz;

        while(ss >> dummyEgy >> ant >> ossz) {
            if (ant == "Antarktisz") {
                megfigyel.antarktisz += ossz;
            }
            megfigyel.ossz += ossz;
        }

        st = f ? norm : abnorm;
    }
};

int main() {

    Status st = abnorm;
    Megfigyeles megfigyel;
    Reader x("inp.txt");
    bool meghalad = false;
    int max = INT_MAX;
    int db = 0;
    megfigyel.antarktisz = 0;
    std::string mikor;
    x.read(st, megfigyel);

    while (st == norm) {

        meghalad = meghalad || megfigyel.ossz > megfigyel.becsles;
        if (meghalad) {
            db += megfigyel.antarktisz;
            if (megfigyel.ossz < max) {
                max = megfigyel.ossz;
                mikor = megfigyel.datum;
            }
        }
        x.read(st, megfigyel);
    }

    std::cout << db << " " << mikor << " " << max;
    return 0;
}