import matek.algebra.ValosMatrix;

class ValosMatrixDemo {
    public static void main(String[] args) {
        double[][] d = { { 1, 2, 3 }, { 4, 5, 6 }, { 9, 1, 3} };
        double[][] v = { { 5, 5, 5 }, { 1, 1, 1 }, { 2, 1, 2} };
        ValosMatrix D = new ValosMatrix(d);
        ValosMatrix V = new ValosMatrix(v);
        System.out.println(D);
        // D = D.transzponalt();
        // System.out.println(D);
        System.out.println(V);
        // D = D.hozzaad(V);
        // System.out.println(D);
        // System.out.println(D.egyenloE(V));
    }
}