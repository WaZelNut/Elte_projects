public class Hallgato {

    private final String nev;
    private final int szuletesiEv;

    public Hallgato(String nev, int szuletesiEv) {
        this.nev = nev;
        this.szuletesiEv = szuletesiEv;
    }

    @Override
    public boolean equals(Object obj) {
         if (obj == this) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        Hallgato tmp = (Hallgato)obj;
        
        return tmp.nev == nev && tmp.szuletesiEv == szuletesiEv;
    }

    @Override
    public int hashCode() {
        return java.util.Objects.hash(nev, szuletesiEv);
    }
}