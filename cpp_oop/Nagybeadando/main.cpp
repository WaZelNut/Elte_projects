#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <thread>
#include <chrono>
#include "conditions.h"
#include "atmosphere.h"

void create(const std::string &str, std::vector<Atmosphere*> &atmosphere, std::vector<Conditions*> &condition, int &length) {
    std::ifstream f(str);
    if (f.fail()) {
        std::cout << "Give a proper file name!\n";
    }

    int n;
    f >> n;
    length = n;
    char ch;
    double thick;
    for (int i = 0; i < n; i++) {
        f >> ch >> thick;
        atmosphere.push_back(Atmosphere::create(ch, thick));
    }
    std::string weather;
    f >> weather;
    
    for (int i = 0; i < weather.size(); i++) {
        condition.push_back(Conditions::create(weather.at(i)));
    }
}

void simulate(std::vector<Atmosphere*> &atmosphere, std::vector<Conditions*> condition, int length) {
    int iteracio = 0;
    int nextCond = 0;
    int nextAtm = 0;
    datas data;

    while (length*3 >= atmosphere.size() && atmosphere.size() >= 3 || nextCond != 0) {
        nextAtm = 0;
        int tmpLength = atmosphere.size();
        int tempAtm = 0;
        for (int i = 0; i < tmpLength; i++) {
            tempAtm = nextAtm;
            data = atmosphere.at(nextAtm)->transform(condition.at(nextCond));

            
            while (nextAtm < atmosphere.size() && data.what != atmosphere.at(nextAtm)->getId()) {
                nextAtm++;
            }

            if (nextAtm >= atmosphere.size() && atmosphere.at(tempAtm)->getThickness() != 0.0) {
                if (data.what == "ozone") {
                    atmosphere.push_back(Atmosphere::create('z', data.difference));
                }
                else if (data.what == "oxigen") {
                    atmosphere.push_back(Atmosphere::create('x', data.difference));
                }
                else {
                    atmosphere.push_back(Atmosphere::create('s', data.difference));
                }
            }
            else if (nextAtm < atmosphere.size()) {
                atmosphere.at(nextAtm)->changeThicknessUp(data.difference);
            }

            nextAtm = i+1;
            for (int j = 0; j < atmosphere.size(); j++) {
                if (atmosphere.at(j)->ascend()) {
                    if (atmosphere.size()-1 != j) {
                        delete atmosphere.at(j);
                        atmosphere.erase(atmosphere.begin() + j);
                        tmpLength--;
                        nextAtm--;
                        i--;
                    }
                    else {
                        delete atmosphere.at(j);
                        atmosphere.erase(atmosphere.begin() + j);
                    }
                }
            }
        }
        if (condition.size() > nextCond+1 ) {
            nextCond++;
        }
        else {
            nextCond = 0;
        }
    }
}

void deleteAll(std::vector<Atmosphere*> &atmosphere, std::vector<Conditions*> &condition) {
    for (auto &elem : atmosphere) {
        delete elem;
    }
    Thunderstrom::destroy();
    Sunny::destroy();
    Other::destroy();

    atmosphere.clear();
    condition.clear();
}

// #define NORMAL_MODE
#ifdef NORMAL_MODE

int main() {
    std::vector<Atmosphere*> atmosphere;
    std::vector<Conditions*> condition;
    int length = 0;
    int allapot = 0;
    int iteracio = 0;
    create("inp.txt", atmosphere, condition, length);

    int nextCond = 0;
    int nextAtm = 0;
    datas data;

    while (length*3 >= atmosphere.size() && atmosphere.size() >= 3 || nextCond != 0) {
        nextAtm = 0;
        int tmpLength = atmosphere.size();
        int tempAtm = 0;
        for (int i = 0; i < tmpLength; i++) {
            tempAtm = nextAtm;
            data = atmosphere.at(nextAtm)->transform(condition.at(nextCond));

            
            while (nextAtm < atmosphere.size() && data.what != atmosphere.at(nextAtm)->getId()) {
                nextAtm++;
            }

            if (nextAtm >= atmosphere.size() && atmosphere.at(tempAtm)->getThickness() != 0.0) {
                if (data.what == "ozone") {
                    atmosphere.push_back(Atmosphere::create('z', data.difference));
                }
                else if (data.what == "oxigen") {
                    atmosphere.push_back(Atmosphere::create('x', data.difference));
                }
                else {
                    atmosphere.push_back(Atmosphere::create('s', data.difference));
                }
            }
            else if (nextAtm < atmosphere.size()) {
                atmosphere.at(nextAtm)->changeThicknessUp(data.difference);
            }

            nextAtm = i+1;
            for (int j = 0; j < atmosphere.size(); j++) {
                if (atmosphere.at(j)->ascend()) {
                    if (atmosphere.size()-1 != j) {
                    delete atmosphere.at(j);
                    atmosphere.erase(atmosphere.begin() + j);
                    tmpLength--;
                    nextAtm--;
                    i--;
                    }
                    else {
                        delete atmosphere.at(j);
                        atmosphere.erase(atmosphere.begin() + j);
                    }
                }
            }
        }
        if (condition.size() > nextCond+1 ) {
            nextCond++;
        }
        else {
            nextCond = 0;
            iteracio++;
            std::cout << "------------" << iteracio << " iteracio" << "------------\n";
            for (int i = 0; i < atmosphere.size(); i++) {
            std::cout << atmosphere.at(i)->getId() << " " << atmosphere.at(i)->getThickness() << "\n";
        }
        std::cout << "\n";
        }
    }
    deleteAll(atmosphere, condition);
    return 0;
}

#else
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE("1", "inp1*.txt") {
    std::vector<Atmosphere*> atmosphere;
    std::vector<Conditions*> condition;
    int length = 0;

    create("inp11.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 0);
    deleteAll(atmosphere, condition);

    create("inp12.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 1);
    deleteAll(atmosphere, condition);

    create("inp13.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 2);
    deleteAll(atmosphere, condition);
    
    create("inp14.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 10);
    deleteAll(atmosphere, condition);
}

TEST_CASE("2", "intp2*.txt") {
    std::vector<Atmosphere*> atmosphere;
    std::vector<Conditions*> condition;
    int length = 0;

    create("inp21.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.at(0)->getId() == "oxigen");
    CHECK(atmosphere.at(1)->getId() == "ozone");
    deleteAll(atmosphere, condition);

    create("inp22.txt", atmosphere, condition, length);
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.at(8)->getId() == "oxigen");
    CHECK(atmosphere.at(9)->getId() == "ozone");
    deleteAll(atmosphere, condition);
}

TEST_CASE("3", "") {
    std::vector<Atmosphere*> atmosphere;
    std::vector<Conditions*> condition;
    int length = 0;

    atmosphere.push_back(new Oxigen(0.51));
    atmosphere.push_back(new Oxigen(0.51));
    atmosphere.push_back(new Oxigen(5));
    condition.push_back(Other::instance());
    simulate(atmosphere, condition, length);

    CHECK(atmosphere.at(0)->getId() == "oxigen");
    deleteAll(atmosphere, condition);
}

TEST_CASE("4", "") {
    std::vector<Atmosphere*> atmosphere;
    std::vector<Conditions*> condition;
    int length = 0;

    atmosphere.push_back(new Ozone(5));
    atmosphere.push_back(new Ozone(5));
    atmosphere.push_back(new Ozone(5));
    condition.push_back(Other::instance());
    length = atmosphere.size();
    simulate(atmosphere, condition, length);

    CHECK(atmosphere.size() == 0);
    CHECK(condition[0] == Other::instance());
    deleteAll(atmosphere, condition);

    atmosphere.push_back(new CarbonMonoxide(5));
    atmosphere.push_back(new CarbonMonoxide(5));
    atmosphere.push_back(new CarbonMonoxide(5));
    condition.push_back(Sunny::instance());
    length = atmosphere.size();
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 0);
    CHECK(condition.at(0) == Sunny::instance());
    deleteAll(atmosphere, condition);

    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    condition.push_back(Thunderstrom::instance());
    length = atmosphere.size();
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 1);
    CHECK(condition.at(0) == Thunderstrom::instance());
    deleteAll(atmosphere, condition);

    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    condition.push_back(Sunny::instance());
    length = atmosphere.size();
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 0);
    CHECK(condition.at(0) == Sunny::instance());
    deleteAll(atmosphere, condition);

    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    atmosphere.push_back(new Oxigen(5));
    condition.push_back(Other::instance());
    length = atmosphere.size();
    simulate(atmosphere, condition, length);
    CHECK(atmosphere.size() == 0);
    CHECK(condition.at(0) == Other::instance());
    deleteAll(atmosphere, condition);
}
#endif