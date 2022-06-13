package data.advanced;

import java.util.ArrayList;

public class IntList {
    protected int maxSize;
    protected ArrayList<Integer> array;

    public IntList() {} // Ez kell, hogy a NamedIntList-ben legyen egy 1 paraméteres String váró konstruktor

    public IntList(int[] other) {  // A konstruktor nincs jól megfogalmazva
        array = new ArrayList<>();
        for (int i = 0; i < other.length; i++) {
            array.add(other[i]);
        }
        maxSize = other.length * 2; //hogy le tudjam tesztelni a main függvényben a többi metódust is
    }

    public void add(int number) {
        if (array.size() + 1 > maxSize) {
            throw new IllegalStateException("Your list can't take another element, the list not big enough.");
        }
        array.add(number);

    }

    public void concat(IntList series) {
        if (array.size() + series.array.size() > maxSize) {
            throw new IllegalStateException("Can't push the elements, the list not big enough");
        }
        for (int i = 0; i < series.array.size(); i++) {
            add(series.array.get(i));
        }
    }

    public String toString() {
        if (array.isEmpty()) {
            return "empty";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.size(); i++) {
            sb.append(array.get(i) + ", ");
        }
        sb.delete(sb.length()-2, sb.length());
        return sb.toString();
    }

    public void removeItemsGreaterThan(int limit) {
        for (int i = 0; i < array.size(); i++) {
            if (array.get(i) > limit) {
                array.remove(i);
            }
        }
    }

    public ArrayList<Integer> getData() {
        ArrayList<Integer> tmp = new ArrayList<>();
        for (int i = 0; i < array.size(); i++) {
            tmp.add(array.get(i));
        }

        return tmp;
    }
}