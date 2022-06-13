package restaurant;

import goods.drinks.Beverage;
import restaurant.customer.Guest;
import restaurant.service.Bartender;
import restaurant.customer.types.Adult;
import restaurant.customer.types.Minor;
import goods.GoodsException;

public class Demo {
    public static void main(String[] args) {
        Beverage superDrink = new Beverage("kidBeer", 6);
        System.out.println(superDrink.getName() + " drink is for pver " + superDrink.getLegalAge());
        Minor kleon = new Minor("Kleon", 17);
        System.out.println(kleon.getName() + " is " + kleon.getAge());
        Bartender bar = new Bartender();
        if (bar.order(superDrink, kleon)) {
            System.out.println(kleon.getName() + " ordered " + superDrink.getName());
        }
        else {
            System.out.println(kleon.getName() + " couldn't ordered " + superDrink.getName());
        }

        superDrink.setLegalAge(18);
        superDrink.setName("superBeer");
        System.out.println(superDrink.getName() + " is the name now, it's for " + superDrink.getLegalAge() + " or older ");
        if (bar.order(superDrink, kleon)) {
            System.out.println(kleon.getName() + " ordered " + superDrink.getName());
        }
        else {
            System.out.println(kleon.getName() + " couldn't ordered " + superDrink.getName() + "\n");
        }

        Adult kleonApa = new Adult("Kleon apja", 45);
        System.out.println(kleonApa.getName() + " is " + kleonApa.getAge());
        superDrink.setLegalAge(5);
        System.out.println(superDrink.getName() + " is for over " + superDrink.getLegalAge());
         if (bar.order(superDrink, kleonApa)) {
            System.out.println(kleonApa.getName() + " ordered " + superDrink.getName());
        }
        else {
            System.out.println(kleonApa.getName() + " couldn't ordered " + superDrink.getName());
        }

        superDrink.setLegalAge(21);
         System.out.println(superDrink.getName() + " is for over " + superDrink.getLegalAge());
         if (bar.order(superDrink, kleonApa)) {
            System.out.println(kleonApa.getName() + " ordered " + superDrink.getName());
        }
        else {
            System.out.println(kleonApa.getName() + " couldn't ordered " + superDrink.getName());
        }

        try {
            Beverage badDrink = new Beverage("", -1);
        } catch (GoodsException ex) {
            System.out.println(ex);
        }
    }
}