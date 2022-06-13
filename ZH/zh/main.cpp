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
bool benneVanAHentes(int hentes, vector<arusHus> husos, int &ind);

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








    vector<arusHus> husos;


    int ind = 0;
    for (int i = 0; i < adatok.size(); i++) {
        if (benneVanAHentes(adatok.at(i).hentes, husos, ind)) {
            int szamlalo = 0;
            for (int j = 0; j < husos.at(ind).hust.size(); j++) {
                if (adatok.at(i).husnev != husos.at(ind).hust.at(j)) {
                    szamlalo++;
                }

            }
            if (szamlalo == husos.at(ind).hust.size()) { //mindegyik hús különbözõ volt
                husos.at(ind).hust.push_back(adatok.at(i).husnev);
            }
        }
        else {
            arusHus sv;
            sv.arus = adatok[i].hentes;
            sv.hust.push_back(adatok.at(i).husnev);
            husos.push_back(sv);
        }
    }

    /* for (int j = 0; j < husos.size(); j++) { debug
    cout << husos[j].arus << endl;
        for (int i = 0; i < husos.at(j).hust.size(); i++) {
            cout << husos[j].hust[i] << " " << endl;

        }
    }*/


    int nagykereskedo = 0;
    for (int j = 0; j < husos.size(); j++) {
            int i;
        for (i = 0; i < j; i++) {
            if (husos[j].hust == husos[i].hust) {
                break;
            }
        }
        if (i == j) {
            nagykereskedo++;
        }
    }

    cout << nagykereskedo << endl;

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

bool benneVanAHentes(int hentes, vector<arusHus> husos, int &ind) {
    ind = 0;
    while (ind < husos.size() && !(hentes == husos.at(ind).arus)) {
        ind++;
    }
    return (ind < husos.size());
}
