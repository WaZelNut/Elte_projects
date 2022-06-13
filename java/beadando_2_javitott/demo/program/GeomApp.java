package demo.program;

import geom.alakzat.Szakasz;
import geom.primitiv.Pont;

public class GeomApp {
    public static void main(String[] args){
        Pont p1 = new Pont(1,2);
        Pont p2 = new Pont(5,5);
        System.out.println("p1.y value: " + p1.getY());
        p1.setY(1.0);
        System.out.println("p1.y new value: " + p1.getY() + "\n");
        Szakasz szakasz = new Szakasz();
        System.out.println("Szakasz.A.x: " + szakasz.getA().getX());
        System.out.println("Szakasz.B.x: " + szakasz.getB().getX());
        System.out.println("midpoint of a segment.x: " + szakasz.felezopont().getX());
        System.out.println("Szakasz.A.y: " + szakasz.getA().getY());
        System.out.println("Szakasz.B.y: " + szakasz.getB().getY());
        System.out.println("midpoint of a segment.y: " + szakasz.felezopont().getY() + "\n");
        // szakasz.setA(p1);
        // szakasz.setA(p1) doesn't work, because p2 also (1,1) here,
        // so it would fall to 1 point and threw exception, so the code works properly
        szakasz.setA(p2);
        szakasz.setB(p1);
        System.out.println("New Szakasz.A.x: " + szakasz.getA().getX());
        System.out.println("New Szakasz.B.x: " + szakasz.getB().getX());
        System.out.println("New midpoint of a segment.x " + szakasz.felezopont().getX());
        System.out.println("New Szakasz.A.y: " + szakasz.getA().getY());
        System.out.println("New Szakasz.B.y: " + szakasz.getB().getY());
        System.out.println("New midpoint of a segment.y " + szakasz.felezopont().getY());
    }
}