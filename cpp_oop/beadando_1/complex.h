#if !defined (COMPLEX_H)
#define COMPLEX_H

// #include <iosfwd>

class complex{
    public:
        double valos = 0;
        double kepzetes = 0;


        void setValos(double _valos);
        void setKepzetes(double _kepzetes);
        complex(double _valos, double _kepzetes);
        complex operator+(const complex &szam2) const;
        complex operator-(const complex &szam2) const;
        complex operator*(const complex &szam2) const;
        complex operator/(const complex &szam2) const;
        // friend std::ostream &operator<<(std::ostream &os, const complex &obj);
};

#endif //COMPLEX_H