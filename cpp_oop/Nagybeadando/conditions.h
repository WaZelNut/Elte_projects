#pragma once

#include <iostream>
class Ozone;
class Oxigen;
class CarbonMonoxide;

class Conditions {
    public:
        virtual std::string change(Ozone *p, double &diff) = 0;
        virtual std::string change(Oxigen *p, double &diff) = 0;
        virtual std::string change(CarbonMonoxide *p, double &diff) = 0;
        virtual ~Conditions() {}
        static Conditions* create(char c);
};

class Thunderstrom : public Conditions {
    public:
        static Thunderstrom* instance();
        std::string change(Ozone *p, double &diff) override;
        std::string change(Oxigen *p, double &diff) override;
        std::string change(CarbonMonoxide *p, double &diff) override;
        void static destroy() { if (_instance != nullptr) delete _instance; _instance = nullptr; }
    private:
        Thunderstrom() {}
        static Thunderstrom* _instance;
};

class Sunny : public Conditions {
    public:
        static Sunny* instance();
        std::string change(Ozone *p, double &diff) override;
        std::string change(Oxigen *p, double &diff) override;
        std::string change(CarbonMonoxide *p, double &diff) override;
        void static destroy() { if (_instance != nullptr) delete _instance; _instance = nullptr; }
    private:
        Sunny() {}
        static Sunny* _instance;
};

class Other : public Conditions {
    public:
        static Other* instance();
        std::string change(Ozone *p, double &diff) override;
        std::string change(Oxigen *p, double &diff) override;
        std::string change(CarbonMonoxide *p, double &diff) override;
        void static destroy() { if (_instance != nullptr) delete _instance; _instance = nullptr; }
    private:
        Other() {}
        static Other* _instance;
};