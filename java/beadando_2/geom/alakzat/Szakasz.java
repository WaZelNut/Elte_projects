package geom.alakzat;

import geom.primitiv.Pont;

public class Szakasz {
    private Pont a;
    private Pont b;
    final double limit = 0.0001;


    public Szakasz(Pont a, Pont b) {
        degenIntoPoints(a, b);
        this.a = a;
        this.b = b;
    }

    public Szakasz() {
        this(new Pont(0,0),new Pont(1,1));
    }

    public void setA(Pont a) {
        nullPointer(a);
        this.a = a;
    }

    public void setB(Pont b) {
        nullPointer(a);
        this.b = b;
    }

    public Pont getA() {
        return a;
    }

    public Pont getB() {
        return b;
    }

    public Pont felezopont() {
        degenIntoPoints(a, b);
        Pont ab = new Pont((a.getX() + b.getX()) / 2 , (a.getY() + b.getY()) / 2);
        return ab;
    }

    private void degenIntoPoints(Pont a, Pont b) throws IllegalArgumentException {
        if (Math.abs(a.getX() - b.getX()) < limit && Math.abs(a.getY() - b.getY()) < 0.0001) {
           throw new IllegalArgumentException(); 
        }
    }

    private void nullPointer(Pont point) throws IllegalArgumentException {
        if (point == null) {
            throw new NullPointerException();
        }
    }
}