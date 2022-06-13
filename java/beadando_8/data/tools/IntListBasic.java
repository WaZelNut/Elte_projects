package data.tools;

public class IntListBasic {
    private int actualSize;
    private int maxSize;
    private int[] array;

    public IntListBasic(int maxSize) {
        this.maxSize = maxSize;
        actualSize = 0;
        array = new int[maxSize];
    }

    public void add(int number) {
        if (actualSize + 1 > maxSize) {
            throw new IllegalStateException("Your list can't take another element, the list not big enough.");
        }
        array[actualSize] = number;
        actualSize++;

    }

    public void concat(IntListBasic series) {
        if (actualSize + series.actualSize > maxSize) {
            throw new IllegalStateException("Can't push the elements, the list not big enough");
        }
        for (int i = 0; i < series.actualSize; i++) {
            add(series.array[i]);
        }
    }

    public String toString() {
        if (actualSize == 0) {
            return "empty";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < actualSize; i++) {
            sb.append(array[i] + ", ");
        }
        sb.delete(sb.length()-2, sb.length());
        return sb.toString();
    }

    public void removeItemsGreaterThan(int limit) {
        int[] tempArray = new int[maxSize];
        int tmp = 0;
        for (int i = 0; i < array.length; i++) {
            if (array[i] > limit) {
                tempArray[tmp] = array[i];
                tmp++;
            }
        }

        array = new int[tmp];
        actualSize = 0;
        for (int i = 0; i < tmp; i++) {
            array[i] = tempArray[i];
            actualSize++;
        }
    }

}