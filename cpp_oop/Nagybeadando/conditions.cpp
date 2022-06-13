#include "conditions.h"
#include "atmosphere.h"

Conditions* Conditions::create(char c) {
    switch (c) {
        case 'z': return Thunderstrom::instance();
        case 'n': return Sunny::instance();
        case 'm': return Other::instance();
    }
    return nullptr;
}

Thunderstrom* Thunderstrom::_instance = nullptr;
Thunderstrom* Thunderstrom::instance() {
    if (_instance == nullptr) {
        _instance = new Thunderstrom();
    }
    return _instance;
}

std::string Thunderstrom::change(Ozone *p, double &diff) {
    return "ozone";
}

std::string Thunderstrom::change(Oxigen *p, double &diff) {
    diff = p->getThickness() - (p->getThickness()/2);
    p->changeThicknessDown(p->getThickness()/2);
    if (p->ascend()) {
        diff += p->getThickness();
        p->changeThicknessDown(p->getThickness());
    }
    return "ozone";
}

std::string Thunderstrom::change(CarbonMonoxide *p, double &diff) {
    return "carbonMonoxide";
}



Sunny* Sunny::_instance = nullptr;
Sunny* Sunny::instance() {
    if (_instance == nullptr) {
        _instance = new Sunny();
    }
    return _instance;
}

std::string Sunny::change(Ozone *p, double &diff) {
    return "ozone";
}

std::string Sunny::change(Oxigen *p, double &diff) {
    diff = p->getThickness() - ((p->getThickness()/100)*95);
    p->changeThicknessDown((p->getThickness()/100)*5);
    if (p->ascend()) {
        diff += p->getThickness();
        p->changeThicknessDown(p->getThickness());
    }
    return "ozone";
}

std::string Sunny::change(CarbonMonoxide *p, double &diff) {
    diff = p->getThickness() - ((p->getThickness()/100)*95);
    p->changeThicknessDown((p->getThickness()/100)*5);
    if (p->ascend()) {
        diff += p->getThickness();
        p->changeThicknessDown(p->getThickness());
    }
    return "oxigen";
}



Other* Other::_instance = nullptr;
Other* Other::instance() {
    if (_instance == nullptr) {
        _instance = new Other();
    }
    return _instance;
}

std::string Other::change(Ozone *p, double &diff) {
    diff = p->getThickness() - ((p->getThickness()/100)*95);
    p->changeThicknessDown((p->getThickness()/100)*5);
    if (p->ascend()) {
        diff += p->getThickness();
        p->changeThicknessDown(p->getThickness());
    }
    return "oxigen";
}

std::string Other::change(Oxigen *p, double &diff) {
    diff = p->getThickness() - ((p->getThickness()/100)*90);
    p->changeThicknessDown((p->getThickness()/100)*10);
    if (p->ascend()) {
        diff += p->getThickness();
        p->changeThicknessDown(p->getThickness());
    }
    return "carbonMonoxide";
}

std::string Other::change(CarbonMonoxide *p, double &diff) {
    return "carbonMonoxide";
}
    