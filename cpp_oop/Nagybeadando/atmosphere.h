#pragma once

#include <fstream>
#include <string>
#include "conditions.h"

struct datas {
    std::string what;
    double difference;
};

class Atmosphere {
    protected:
        double thickness;
        std::string id;
        datas data;
        Atmosphere (double thick = 0) : thickness(thick) {}
    public:
        bool ascend() const { return thickness <= 0.5; }
        void changeThicknessUp(double thick) { thickness += thick; }
        void changeThicknessDown(double thick) { thickness -= thick; }
        double getThickness() { return thickness; }
        virtual ~Atmosphere() {}
        virtual datas transform(Conditions* cond) = 0;
        static Atmosphere* create(char ch, double thick);
        std::string getId() { return id; }

};

class Ozone : public Atmosphere {
    public:
    Ozone(double thick = 0) : Atmosphere(thick) { this->id = "ozone"; }
    datas transform(Conditions* cond) {
        double diff = 0;
        data.what = cond->change(this, diff);
        data.difference = diff;
        return data;    
    }
};

class Oxigen : public Atmosphere {
    public:
    Oxigen(double thick = 0) : Atmosphere(thick) { this->id = "oxigen"; }
    datas transform(Conditions* cond) override {
        double diff = 0;
        data.what = cond->change(this, diff);
        data.difference = diff;
        return data;
    }
};

class CarbonMonoxide : public Atmosphere {
    public:
    CarbonMonoxide(double thick = 0) : Atmosphere(thick) { this->id = "carbonMonoxide"; }
    datas transform(Conditions* cond) {
        double diff = 0;
        data.what = cond->change(this, diff);
        data.difference = diff;
        return data;
    }
};
