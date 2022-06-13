package univ.app.console.demo;

import univ.szereplo.Hallgato;
import univ.kar.Kar;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

public class HallgatoDemo {
    public static void main(String[] args) throws IllegalArgumentException {
        if (args.length == 0) {
            System.err.println("fajlnev megadasa kotelezo!");
        }

        File input = new File("hallgato-in.txt");
        File output = new File("hallgato-out.txt");

        try (Scanner sc = new Scanner(input);
            PrintWriter pw = new PrintWriter(output);
            ) {
            int tombHossz = Integer.parseInt(sc.nextLine());
            Hallgato[] hallgatok = new Hallgato[tombHossz];
            int lepteto = 0;
            while (sc.hasNextLine()) {
                String line = sc.nextLine();
                try {
                    hallgatok[lepteto] = new Hallgato(line);
                    lepteto++;
                }
            catch (IllegalArgumentException e) {}
            }
            pw.println(Hallgato.getKovetkezoSorszam());
            for (int i = 0; i < lepteto; i++) {
                pw.print(hallgatok[i].getSorszam() + ": ");
                pw.println(hallgatok[i]);
            }

            if (Hallgato.getKovetkezoSorszam() != 1000) {
                int min = hallgatok[0].getSzuletesiIdo();
                int max = min;
                for (int i = 1; i < lepteto; i++) {
                    min = Math.min(max, hallgatok[i].getSzuletesiIdo());
                }
                for (int i = 1; i < lepteto; i++) {
                    max = Math.max(max, hallgatok[i].getSzuletesiIdo());
                }
            pw.println(min);
            pw.println(max);
            }
        }
        catch (FileNotFoundException e) {
             System.err.println("az elso parameterben fajlnevet kell megadni");
        }
    }
}