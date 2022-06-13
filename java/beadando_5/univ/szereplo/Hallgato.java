package univ.szereplo;

import univ.kar.Kar;

public class Hallgato {
    private String neptunKod;
    private int szuletesiIdo;
    private Kar[] karok;
    private static int sorszam = 999;
    private int egyediSorszam = 999;

    private Hallgato(String neptunKod, int szuletesiIdo, Kar[] karok) throws IllegalArgumentException {
        this.neptunKod = neptunKod;
        this.szuletesiIdo = szuletesiIdo;
        this.karok = new Kar[karok.length];
        for (int i = 0; i < karok.length; i++) {
            this.karok[i] = karok[i];
        }
        if (this.neptunKod.length() != 6) {
            throw new IllegalArgumentException("A neptunkod nem 6 hosszu!");
        }
        if (this.szuletesiIdo < 19000101) {
            throw new IllegalArgumentException("1900 január 1-e előtti dátum!");
        }
        if (this.szuletesiIdo > 20081231) {
            throw new IllegalArgumentException("2008 december 31-e utáni dátum!");
        }
        sorszam++;
        egyediSorszam = sorszam;
    }

    public Hallgato(String egyHallgato) {
        this(getNepKod(egyHallgato), getSzulIdo(egyHallgato), getKaros(egyHallgato));
        // Csak segédmetódusokkal tudtam az első sorba berakni, remélem ez jó megoldás :D
    }

    public String getNeptunKod() {
        return neptunKod;
    }

    public int getSzuletesiIdo() {
        return szuletesiIdo;
    }

    public Kar[] getKarok() {
        Kar[] visszaAd = new Kar[karok.length];
        for (int i = 0; i < karok.length; i++) {
            visszaAd[i] = karok[i];
        }
        return visszaAd;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(neptunKod + "," + szuletesiIdo + ",");
        for (int i = 0; i < karok.length; i++) {
            sb.append(karok[i] + "+");
        }
        sb.delete(sb.length()-1, sb.length());
        return sb.toString();
    }

    public int getSorszam() {
        return egyediSorszam;
    }

    public static int getKovetkezoSorszam() {
        return sorszam + 1;
    }

    private static String getNepKod(String egyHallgato) {
        String[] elemek = egyHallgato.split(",");
        String nepKod = elemek[0];
        return nepKod;
    }

    private static int getSzulIdo(String egyHallgato) {
        String[] elemek = egyHallgato.split(",");
        int szulIdo = Integer.parseInt(elemek[1]);
        return szulIdo;
    }

    private static Kar[] getKaros(String egyHallgato) throws IllegalArgumentException {
        String[] elemek = egyHallgato.split(",");
        String[] kar = elemek[2].split("\\+");
        Kar[] karos = new Kar[kar.length];
        for (int i = 0; i < kar.length; i++) {
                Kar test = Kar.valueOf(kar[i]);
                karos[i] = Kar.valueOf(kar[i]);   //kar[i]
        }
        return karos;
    }

}