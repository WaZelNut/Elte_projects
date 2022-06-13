package restaurant.customer.types;

import restaurant.customer.Guest;

public class Adult extends Guest {
    public Adult(String name, int age) {
        this.name = name;
        this.age = age;
    }
}