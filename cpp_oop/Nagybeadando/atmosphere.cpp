#include "atmosphere.h"

Atmosphere* Atmosphere::create(char ch, double thick) {
    switch(ch) {
        case 'z': return new Ozone(thick);
        case 'x': return new Oxigen(thick);
        case 's': return new CarbonMonoxide(thick);
    }
    return nullptr;
}