package tools.safemath;

public class Incrementer {
    public static int incremente(int number) {
        if (number < Integer.MAX_VALUE) {
            return number + 1;
        }
        return number;
    }
}