#include <iostream>
//Ide irja be az include-okat (#include "kft.h", stb)

using namespace std;

int main()
{
    Kft* kft = new Kft;
    Bufe* b1=new Bufe("a1","c1");
    Bufe* b2=new Bufe("a2","c2");
    Bufe* b3=new Bufe("a3","c3");
    Bufe* ptr;
    kft->UzletetNyit(b1);
    kft->UzletetNyit(b2);
    kft->UzletetNyit(b3);
    try
    {
        Bufe* b4=new Bufe("a3","c4");
        ptr=b4;
        kft->UzletetNyit(b4);
    }
    catch (...)
    {
        cout << "Letezo uzlet - Helyesen kezelve" << endl;
        delete ptr;
    }
    try
    {
        Bufe* b4=new Bufe("a4","c3");
        ptr=b4;
        kft->UzletetNyit(b4);
    }
    catch (...)
    {
        cout << "Letezo uzlet - Helyesen kezelve" << endl;
        delete ptr;
    }

    Vendeg* v1 = new Vendeg;
    Vendeg* v2 = new Vendeg;
    Vendeg* v3 = new Vendeg;

    kft->Kartyatad(v1);
    kft->Kartyatad(v2);
    kft->Kartyatad(v3);

    v1->Vasarol(b1,"csirke",300,true,"kicsi");
    v1->Vasarol(b2,"hekk",300,true,"kicsi");
    v1->Vasarol(b3,"csirke",300,true,"kicsi");
    v2->Vasarol(b1,"hekk",3,true,"kicsi");

    cout << kft->MindenholVolt() << endl;
    cout << b1->Mennyit(v1) << endl;
    cout << b1->Hany() << endl;




    Kicsi::destroy();
    Kozepes::destroy();
    Nagy::destroy();

    return 0;
}
