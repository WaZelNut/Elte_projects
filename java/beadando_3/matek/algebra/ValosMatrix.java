package matek.algebra;

public class ValosMatrix {
    private int m;
    private int n;
    private double[][] matrix;

    public ValosMatrix(int m, int n) {
        this.m = m;
        this.n = n;
        matrix = new double[m][n];
    }

    public ValosMatrix (double[][] primitiv) {
        m = primitiv.length;
        n = primitiv[0].length;
        matrix = new double[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = primitiv[i][j];
            }
        }
    }

    public ValosMatrix (int meret) {
        m = meret;
        n = meret;
        matrix = new double[m][n];
    }

    public ValosMatrix transzponalt() {
        ValosMatrix transz = new ValosMatrix(n, m);
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                transz.matrix[j][i] = this.matrix[i][j];
            }
        }
        return transz;
    }

    public ValosMatrix hozzaad(ValosMatrix masik) {
        ValosMatrix osszeges = new ValosMatrix(m, n);
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                osszeges.matrix[i][j] = this.matrix[i][j] + masik.matrix[i][j];
            }
        }
        return osszeges;
    }

    public ValosMatrix kivon(ValosMatrix kivonando) {
        ValosMatrix kivonos = new ValosMatrix(m, n);
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                kivonos.matrix[i][j] = this.matrix[i][j] - kivonando.matrix[i][j];
            }
        }
        return kivonos;
    }

    public boolean egyenloE(ValosMatrix masik) {
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (this.matrix[i][j] != masik.matrix[i][j])  return false;
            }
        }
        return true;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                sb.append(this.matrix[i][j]);
                sb.append("\t");
            }
            sb.delete(sb.length()-1,sb.length());
            sb.append(", \n");
        }
        sb.delete(sb.length()-3, sb.length());
        sb.append("]");
        return(sb.toString());
    }
}