package univ.kar;

public enum Kar {
    AJTK("Faculty of Law", 1977, 4.3),
    BGGYK("Faculty of Bugs", 1879, 5.2),
    BTK("Faculty of Wise People", 1009, 1.1),
    GTK("Faculty of Stocks", 1919, 6.3),
    IK("Faculty of Informatics", 2003, 19.9),
    PPK("Faculty of Magic People", 1999, 2.4),
    TOK("Faculty of Teachers", 1798, 4.5),
    TATK("Faculty of Society", 1872, 3.4),
    TTK("Faculty of Environment", 1920, 7.7);

    private String nevAngol;
    private int alapitasEv;
    private double koltsegvetesMilioHuf;

    Kar(String nevAngol, int alapitasEv, double koltsegvetesMilioHuf) {
        this.nevAngol = nevAngol;
        this.alapitasEv = alapitasEv;
        this.koltsegvetesMilioHuf = koltsegvetesMilioHuf;
    }

    public String getNevAngol() {
        return nevAngol;
    }

    public int getAlapitasEv() {
        return alapitasEv;
    }

    public double getKoltsegvetesMilioHuf() {
        return koltsegvetesMilioHuf;
    }

    public String toString() {
        int cmp = alapitasEv % 10;
        String outStr;
        switch(cmp) {
            case 1: case 2: case 4: case 5: case 7: case 9:
                outStr = String.format("%s [%s], alapitva: %d-ben, %f HUF", this.name(), nevAngol, alapitasEv, koltsegvetesMilioHuf);
                break;
            case 3: case 6: case 8:
                outStr = String.format("%s [%s], alapitva: %d-ban, %f HUF", this.name(), nevAngol, alapitasEv, koltsegvetesMilioHuf);
                break;
            default:
                outStr = String.format("%s [%s], alapitva: %d. evben, %f HUF", this.name(), nevAngol, alapitasEv, koltsegvetesMilioHuf);
                break;
        }
        return (outStr);
    }
}