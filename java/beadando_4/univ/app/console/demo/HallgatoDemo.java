package univ.app.console.demo;

import univ.szereplo.Hallgato;
import univ.kar.Kar;

public class HallgatoDemo {
    public static void main(String[] args) {
        Hallgato[] hallgatok = new Hallgato[args.length];
        for (int i = 0; i < args.length; i++) {
            hallgatok[i] = new Hallgato(args[i]);
        }
        System.out.println(Hallgato.getKovetkezoSorszam());

        for (int i = 0; i < hallgatok.length; i++) {
            System.out.print(hallgatok[i].getSorszam() + ": ");
            System.out.println(hallgatok[i]);
        }
        if (Hallgato.getKovetkezoSorszam() != 1000) {
            int min = hallgatok[0].getSzuletesiIdo();
            int max = min;
            for (int i = 1; i < hallgatok.length; i++) {
                min = Math.min(max, hallgatok[i].getSzuletesiIdo());
            }
            for (int i = 1; i < hallgatok.length; i++) {
                max = Math.max(max, hallgatok[i].getSzuletesiIdo());
            }
            System.out.println(min);
            System.out.println(max);
        }
    }
}