package data.tools;

import data.advanced.IntList;
import java.util.ArrayList;

public class NamedIntList extends IntList {
    private String name;

    public NamedIntList(String name) {
        this.name = name;
        array = new ArrayList<>();
        maxSize = 0;
    }

    public NamedIntList(String name, int[] other) {
        super(other);
        this.name = name;
    }

    @Override
    public String toString() {
        if (array.isEmpty()) {
            return "empty";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(name + " ");
        for (int i = 0; i < array.size(); i++) {
            sb.append(array.get(i) + ", ");
        }
        sb.delete(sb.length()-2, sb.length());
        return sb.toString();
    }

}