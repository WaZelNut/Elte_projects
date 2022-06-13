#include <iostream>

bool success = true;

void check(bool l, std::string err)
{
    if (!l)
    {
        success = false;
        std::cerr << "Sikertelen teszt: " << err << std::endl;
    }
}

int main()
{
    Kft* kft =  new Kft;

    Bufe* b1 = new Bufe("lakomativ", "Alsoors Fo utca 3.");
    Bufe* b2 = new Bufe("ratburger", "Balatonfured Burger setany 5.");
    Bufe* b3 = new Bufe("pizzabest", "Nagykanizsa Pizza utca 2.");
    

    // 1. teszt: büfék adattagjainak ellenőrzése
    check(b1->get_azon() == "lakomativ" && b1->get_cim() == "Alsoors Fo utca 3.", "A bufe adattagjai nem megfeleloen vannak beallitva.");
    check(b2->get_azon() == "ratburger" && b2->get_cim() == "Balatonfured Burger setany 5.", "A bufe adattagjai nem megfeleloen vannak beallitva.");
    check(b3->get_azon() == "pizzabest" && b3->get_cim() == "Nagykanizsa Pizza utca 2.", "A bufe adattagjai nem megfeleloen vannak beallitva.");

    // 2. teszt: Kft<->Bufe kapcsolat ellenőrzése
    std::string kftBufeHiba = "Kft <-> Bufe kapcsolat hiba.";
    check(kft->get_uzletek().size() == 0, kftBufeHiba);
    kft->UzletetNyit(b1);
    check(kft->get_uzletek().size() == 1, kftBufeHiba);
    check(kft->get_uzletek()[0] == b1, kftBufeHiba);
    kft->UzletetNyit(b2);
    check(kft->get_uzletek().size() == 2, kftBufeHiba);
    check(kft->get_uzletek()[1] == b2, kftBufeHiba);
    kft->UzletetNyit(b3);
    check(kft->get_uzletek().size() == 3, kftBufeHiba);
    check(kft->get_uzletek()[2] == b3, kftBufeHiba);

    check(b1->get_kft() == kft, kftBufeHiba);
    check(b2->get_kft() == kft, kftBufeHiba);
    check(b3->get_kft() == kft, kftBufeHiba);

    // 3. teszt: Büfé elérése Kft-ből
    std::string bufeEleresHiba = "A bufe valamelyik adattagja nem elereheto a Kft osztalybol vagy nem jol lett beallitva.";
    check(kft->get_uzletek()[0]->get_azon() == "lakomativ", bufeEleresHiba);
    check(kft->get_uzletek()[0]->get_cim() == "Alsoors Fo utca 3.", bufeEleresHiba);
    check(kft->get_uzletek()[1]->get_azon() == "ratburger", bufeEleresHiba);
    check(kft->get_uzletek()[1]->get_cim() == "Balatonfured Burger setany 5.", bufeEleresHiba);
    check(kft->get_uzletek()[2]->get_azon() == "pizzabest", bufeEleresHiba);
    check(kft->get_uzletek()[2]->get_cim() == "Nagykanizsa Pizza utca 2.", bufeEleresHiba);

    // 4. teszt: már hozzáadott büfé hozzáadása
    bool exceptionThrown = false;
    try
    {
        Bufe* b4 = new Bufe("lakomativ", "cim");
        kft->UzletetNyit(b4);
    }
    catch (...)
    {
        exceptionThrown = true;
    }
    check(exceptionThrown, "Tobb bufe objektum hozhato letre ugyanazzal a nevvel vagy nincsen kivetel dobva.");

    
    // 5. teszt: vendégek, Kártyátad() metódus
    Vendeg* v1 = new Vendeg();
    Vendeg* v2 = new Vendeg();

    kft->Kartyatad(v1); 
    kft->Kartyatad(v2);

    check(v1->get_kartya() == "aaa", "Sikertelen kartyaadas muvelet vagy nem \"aaa\" lett atadva."); 
    check(v2->get_kartya() == "aaa", "Sikertelen kartyaadas muvelet vagy nem \"aaa\" lett atadva."); 


    //  Vásárlás menü nélkül
    v1->Vasarol(b1, "hekk", 4, false, "");
    v2->Vasarol(b1, "rantott", 5, false, "");
    v1->Vasarol(b2, "csirke", 2, false, "");
    v1->Vasarol(b3, "hekk", 3, false, "");

    // 6. teszt: Vendég <-> Étel kapcsolat és étel adatttagok
    std::string vendegEtel = "Vendeg <-> Etel kapcsolat hiba vagy hiba az Etel osztalyban.";
    check(v1->get_etelek().size() == 3, vendegEtel);
    check(v2->get_etelek().size() == 1, vendegEtel);

    check(v1->get_etelek()[0]->get_ear() == 400, vendegEtel);
    check(v1->get_etelek()[0]->get_suly() == 4, vendegEtel);
    check(v1->get_etelek()[0]->get_menu() == nullptr, vendegEtel);
    check(v1->get_etelek()[0]->get_vendeg() == v1, vendegEtel);

    check(v1->get_etelek()[1]->get_ear() == 250, vendegEtel);
    check(v1->get_etelek()[1]->get_suly() == 2, vendegEtel);
    check(v1->get_etelek()[1]->get_menu() == nullptr, vendegEtel);
    check(v1->get_etelek()[1]->get_vendeg() == v1, vendegEtel);

    check(v1->get_etelek()[2]->get_ear() == 400, vendegEtel);
    check(v1->get_etelek()[2]->get_suly() == 3, vendegEtel);
    check(v1->get_etelek()[2]->get_menu() == nullptr, vendegEtel);
    check(v1->get_etelek()[2]->get_vendeg() == v1, vendegEtel);
        
    check(v2->get_etelek()[0]->get_ear() == 300, vendegEtel);
    check(v2->get_etelek()[0]->get_suly() == 5, vendegEtel);
    check(v2->get_etelek()[0]->get_menu() == nullptr, vendegEtel);
    check(v2->get_etelek()[0]->get_vendeg() == v2, vendegEtel);

    // 7. teszt: vásárlás, ha vendég nem kapott kártyát
    Vendeg* v3 = new Vendeg();
    v3->Vasarol(b1, "hekk", 7, false, "");
    check(v3->get_etelek().size() == 1, "Hiba a kezdetben kartya nelkuli vasarlasnal.");
    check(v3->get_kartya() == "aaa", "Hiba a kezdetben kartya nelkuli vasarlasnal.");

    // 8. teszt: Büfé <-> Étel kapcsolat
    std::string bufeEtel = "Bufe <-> Etel kapcsolat hiba.";
    check(b1->get_forgalom().size() == 3, bufeEtel);
    check(b2->get_forgalom().size() == 1, bufeEtel);
    check(b3->get_forgalom().size() == 1, bufeEtel);
    
    check(b1->get_forgalom()[0]->get_suly() == 4, bufeEtel);
    check(b1->get_forgalom()[1]->get_suly() == 5, bufeEtel);
    check(b1->get_forgalom()[2]->get_suly() == 7, bufeEtel);
    check(b2->get_forgalom()[0]->get_suly() == 2, bufeEtel);
    check(b3->get_forgalom()[0]->get_suly() == 3, bufeEtel);

    // 9. teszt: Vásárlás menüvel
    v1->Vasarol(b1, "csirke", 5, true, "kicsi");
    v1->Vasarol(b1, "rantott", 1, true, "kozepes");
    v2->Vasarol(b1, "hekk", true, 3, "nagy");

    std::string menuVasarlas = "Hiba a menuvel torteno vasarlas soran vagy a Menu/Meret osztalyban.";
    check(v1->get_etelek()[3]->get_menu()->get_meret()->get_ar() == 550, menuVasarlas);
    check(v1->get_etelek()[3]->get_menu()->get_meret() == Kicsi::instance(), menuVasarlas);

    check(v1->get_etelek()[4]->get_menu()->get_meret()->get_ar() == 700, menuVasarlas);
    check(v1->get_etelek()[4]->get_menu()->get_meret() == Kozepes::instance(), menuVasarlas);

    check(v2->get_etelek()[1]->get_menu()->get_meret()->get_ar() == 900, menuVasarlas);
    check(v2->get_etelek()[1]->get_menu()->get_meret() == Nagy::instance(), menuVasarlas);

    Kicsi::destroy();
    Kozepes::destroy();
    Nagy::destroy();

    if (success)
    {
        std::cout << "Ok" << std::endl;
        return 0;
    }

    return 1;
}