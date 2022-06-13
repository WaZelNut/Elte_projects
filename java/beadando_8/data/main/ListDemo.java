package data.main;

import data.tools.IntListBasic;
import data.advanced.IntList;
import data.tools.NamedIntList;
import java.util.ArrayList;

public class ListDemo {
    public static void main(String[] args) {
        System.out.println("--------Basic--------");
        IntListBasic defaultList = new IntListBasic(3);
        defaultList.add(5);
        System.out.println(defaultList);
        defaultList.add(13);
        System.out.println(defaultList);
        defaultList.add(13);
        System.out.println(defaultList);
        try {
        defaultList.add(13);
        } catch(IllegalStateException e) {
            System.out.println(e);
        }
        IntListBasic defaultListTwo = new IntListBasic(3);
        defaultListTwo.concat(defaultList);
        System.out.println(defaultListTwo);
        defaultListTwo.removeItemsGreaterThan(6);
        System.out.println(defaultListTwo);
        defaultListTwo.removeItemsGreaterThan(15);
        System.out.println(defaultListTwo);


        System.out.println("--------ArrayList--------");
        int[] create = new int[3];
        int[] createTwo = new int[2];
        IntList intList = new IntList(create);
        IntList addList = new IntList(createTwo);
        intList.add(5);
        System.out.println(intList);
        intList.concat(addList);
        System.out.println(intList);
        intList.removeItemsGreaterThan(1);
        System.out.println(intList);

        ArrayList<Integer> array = new ArrayList<>(); // az IntList konstruktora nem megfelelően van megadva szerintem, sokféleképpen lehet értelmezni
        array = intList.getData();
        for (int i = 0; i < array.size(); i++) {
            System.out.print(array.get(i) + " ");
        }
        System.out.println();

        System.out.println("--------NamedIntList--------");
        NamedIntList namedList = new NamedIntList("Kleon", create);
        System.out.println(namedList);
    }  
}