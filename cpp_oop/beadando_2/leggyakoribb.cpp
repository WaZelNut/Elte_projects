#include <iostream>
#include <vector>
#include "leggyakoribb.hpp"

bool Leggyakoribb::read(int &e, Status &st) {
    f >> e;

    st = f ? norm : abnorm;

    return f.fail();
}