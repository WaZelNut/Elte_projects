#include <iostream>
#include <vector>

using namespace std;

struct hentesAdatok {
    string husnev;
    int hentes;
};

struct arusHus {
    int arus;
    vector<string> hust;

};

void adatBeker(int &n, int &m, vector<hentesAdatok> &adatok);
int husfelekSzama(vector<hentesAdatok> adatok, vector<hentesAdatok> &husiTipus);
bool benneVan(string husnev, vector<hentesAdatok> husiTipus, int &ind);
void tobbHus(vector<arusHus> &legtobbHus,vector<hentesAdatok> adatok);
bool benneVan2(int hentes, vector<arusHus> legtobbHus,int &ind);

int main()
{
    int n; //Hentesek száma
    int m; //Arusitok szama
    vector<hentesAdatok> adatok;
    adatBeker(n,m,adatok);
    //sikeres beolvasás
    //cout << endl;
    //cout << adatok[0].husnev;
    vector<hentesAdatok> husiTipus;
    int mennyi = husfelekSzama(adatok, husiTipus);
    cout << "#" << endl;
    cout << mennyi << endl;
    cout << "#" << endl;
    string megoldas = "NINCS";
    for (int i = 0; i < husiTipus.size(); i++) {
        //cout << husiTipus.at(i).hentes; debug
        if (husiTipus.at(i).hentes == 1) {
            megoldas = husiTipus.at(i).husnev;
        }
    }
    cout << megoldas << endl;
    cout << "#" << endl;
    for (int i = 0; i < husiTipus.size(); i++) {
        cout << husiTipus.at(i).husnev << " " << husiTipus[i].hentes << endl;
    }
    cout << "#" << endl;
    //vector<arusHus> legtobbHus;
    //tobbHus(legtobbHus, adatok);
    vector<int> husArus;
    for (int i = 0; i < n; i++) {
        husArus.push_back(0);
    }
    for (int i = 0; i < adatok.size(); i++) {
        husArus[adatok.at(i).hentes - 1]++;
    }
    int maximumInd = 0;
    for (int i = 1; i < husArus.size(); i++) {
        if (husArus[i] > husArus[maximumInd]) {
            maximumInd = i;
        }
    }

    cout << maximumInd + 1 << endl;

    cout << "#" << endl;


    return 0;
}

void adatBeker(int &n, int &m, vector<hentesAdatok> &adatok) {
    cin >> n;
    cin >> m;
    hentesAdatok seged;
    for (int i = 0; i < m; i++) {
        cin >> seged.husnev >> seged.hentes;
        adatok.push_back(seged);
    }
}

int husfelekSzama (vector<hentesAdatok> adatok, vector<hentesAdatok> &husiTipus) {
    int visszaad = 0;
    int ind;
    for (int i = 0; i < adatok.size(); i++) {
        if (benneVan(adatok[i].husnev, husiTipus, ind)) {
                husiTipus.at(ind).hentes++;
        }
        else {
            hentesAdatok sv;
            sv.husnev = adatok[i].husnev;
            sv.hentes = 1;
            husiTipus.push_back(sv);
            visszaad++;
        }
    }
    return visszaad;
}

bool benneVan(string husnev, vector<hentesAdatok> husiTipus, int &ind) {
    ind = 0;
    while (ind < husiTipus.size() && !(husnev == husiTipus.at(ind).husnev)) {
            ind++;
        }
    return (ind < husiTipus.size());
}

/*void tobbHus(vector<arusHus> &legtobbHus,vector<hentesAdatok> adatok) {
    int ind;
    int lepteto = 0;
    for (int i = 0; i < adatok.size(); i++) {
        if (benneVan2(adatok[i].hentes, legtobbHus, ind)) {
                for (int j = 0; j < legtobbHus.size(); j++){
                    if (legtobbHus.at(j).)
                }
        }
        else {
            arusHus sv;
            sv.hust.at(lepteto) = adatok[i].husnev;
            lepteto++;
            sv.arus = adatok[i].hentes;
            legtobbHus.push_back(sv);
        }
    }
}*/

bool benneVan2(int hentes, vector<arusHus> legtobbHus,int &ind) {
    ind = 0;
    while (ind < legtobbHus.size() && !(hentes == legtobbHus.at(ind).arus)) {
            ind++;
        }
    return (ind < legtobbHus.size());
}












/*string megoldas = "NINCS";
    int plussz = 0;
    for (int i = 0; i< husiTipus.size(); i++) {
        plussz = 0;
        for (int j = 1; j < adatok.size(); j++) {
            int segedHentes = adatok.at(0).hentes;
            if (husiTipus.at(i).husnev == adatok.at(j).husnev && adatok.at(j).hentes != segedHentes) {
                plussz++;
            }
        }
        cout << plussz << " " << adatok.size() << endl;
        if (plussz == adatok.size() - 1) {
            megoldas = husiTipus.at(i).hentes;
        }
    }
    cout << megoldas << endl; */
