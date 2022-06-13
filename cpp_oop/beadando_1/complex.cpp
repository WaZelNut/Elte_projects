#include "complex.h"
#include <iostream>


void complex::setValos(double _valos){valos = _valos;}
void complex::setKepzetes(double _kepzetes){kepzetes = _kepzetes;}

complex::complex(double _valos, double _kepzetes) : valos(_valos), kepzetes(_kepzetes) {}


complex complex::operator+(const complex &szam2) const{
    return complex(this->valos + szam2.valos, this->kepzetes + szam2.kepzetes);
}

complex complex::operator-(const complex &szam2) const{
    return complex(this->valos - szam2.valos, this->kepzetes - szam2.kepzetes);
}

complex complex::operator*(const complex &szam2) const{
    return complex((this->valos * szam2.valos) - (this->kepzetes*szam2.kepzetes),
    (this->kepzetes * szam2.valos) + (this->valos*szam2.kepzetes));
}

complex complex::operator/(const complex &szam2) const{
    if(szam2.valos != 0.0 || szam2.kepzetes != 0.0){
        return complex((this->valos*szam2.valos + this->kepzetes*szam2.kepzetes)/(szam2.valos*szam2.valos+szam2.kepzetes*szam2.kepzetes),
        (this->kepzetes*szam2.valos - this->valos*szam2.kepzetes)/(szam2.valos*szam2.valos+szam2.kepzetes*szam2.kepzetes));
    }
    else{
        std::cerr << "Nem jo szam!(0-val osztas)";
        return complex(this->valos, this->kepzetes);
    }
    
}