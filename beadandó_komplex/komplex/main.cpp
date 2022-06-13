/*Készítette: Dósa Kleon
 Neptun: PHMC3S
 E-mail: dosakleon@gmail.com
 Feladat: „ProgAlap komplex beadandó” téma „Minden szempont szerint utolsók” feladat*/

#include <iostream>
#include <vector>

using namespace std;

void bekeres(int n,int m,int* maxErt,int* minErt);

int main()
{
    int n;
    cout << "Add meg a resztvevo kutyak szamat(1..100): ";
    cin >> n; //Résztvevõ kutyák száma, n db sor lesz kutyákból
    int m;
    cout << "Add meg a szempontok szamat(1..100): ";
    cin >> m; //Szempontok száma, m darab oszlop lesz kutyákból
    int minErt[m];
    int maxErt[m];
    int kutyaPontszam[m] = {};
    int kutyaAdatok[n][m];
    bekeres(n,m,maxErt,minErt);

    //Mátrix feltöltése értékekkel
    for(int i = 0;i < n; i++) {
        cout << i+1 << " szamu kutya elert eredmenyei: ";
        for(int j = 0; j < m; j++) {
            cin >> kutyaAdatok[i][j];
        }
    }

    //Debug része, sikeres volt a beolvasás
    // debug: cout << maxErt[7] << endl;
    // debug: cout << kutyaAdatok[0][1] << endl;

    int minimumInd = 0;
    int minimumErt = 101;
    for(int i = 0; i < m; i++) {
        minimumInd = 0;
        minimumErt = 101;
        for(int j = 0; j < n; j++) {
            if (kutyaAdatok[j][i] < minimumErt && minErt[j] <= kutyaAdatok[j][i]) {
                minimumErt = kutyaAdatok[j][i];
                minimumInd = j;
            }
        }
        //cout << minimumErt << " asd ";    debug része
        for(int j = 0; j < n; j++) {
                if (minimumErt == kutyaAdatok[j][i]) {
                kutyaPontszam[j]++;
            }
        }
    }

    /*for (int i = 0; i < m; i++){
        cout << kutyaPontszam[i] << " ";
    }*/

    minimumErt = 0;
    minimumInd = 0;
    vector<int> minimumIndTomb;
    int seged;
    int mennyidarab = 0;
    for (int i = 0; i < m; i++) {
        if (minimumErt < kutyaPontszam[i] && kutyaPontszam[i] != 0) {
            minimumErt = kutyaPontszam[i];
            minimumInd = i + 1;
        }
    }
    for (int i = 0; i < m; i++) {
        if (minimumErt == kutyaPontszam[i]){
            mennyidarab++;
            seged = i + 1;
            minimumIndTomb.push_back(seged);
        }
    }

    cout << mennyidarab << " kutya volt minden szempont szerint utolso!" << endl;


    //sorting
    int temp;
    for(int i = 0; i < minimumIndTomb.size(); i++) {
        for(int j = i+1; j < minimumIndTomb.size(); j++)
        {
            if(minimumIndTomb[j] < minimumIndTomb[i]) {
                temp = minimumIndTomb[i];
                minimumIndTomb[i] = minimumIndTomb[j];
                minimumIndTomb[j] = temp;
            }
        }
    }

    cout << "Az utolso kutyak: ";
    for (int i = 0; i < minimumIndTomb.size(); i++) {
        cout << minimumIndTomb[i] << " ";
    }
    return 0;
}

void bekeres(int n,int m,int* maxErt,int* minErt) {

    cout << "maximum ertekek megadasa (m darab, 1..100!): ";
    for (int i = 0; i < m;i++) {    //Maximum értékek beolvasása
        cin >> maxErt[i];
    }

    cout << "minimum ertekek megadasa (m darab,1..adott maximum ertek!): ";
    for (int i = 0; i < m;i++) {    //Minimum értékekbeolvasása
        cin >> minErt[i];
    }
}
