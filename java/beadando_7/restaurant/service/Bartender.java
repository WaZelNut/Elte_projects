package restaurant.service;

import goods.drinks.Beverage;
import restaurant.customer.Guest;
import restaurant.customer.types.Adult;

public class Bartender {
    
    public boolean order(Beverage drink, Guest guest) {
        if (drink.getLegalAge() >= 18 && !(guest instanceof Adult)) {
            return false;
        }
        return true;
    }

}