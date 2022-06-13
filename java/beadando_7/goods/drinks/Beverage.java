package goods.drinks;

import goods.GoodsException;

public class Beverage {
    private String name;
    private int legalAge;

    public Beverage(String name, int legalAge) {
        if (name.isEmpty() || legalAge < 0) {
            throw new GoodsException("Not a good format");
        }
        this.name = name;
        this.legalAge = legalAge;
    }

    public String getName() {
        return name;
    }

    public int getLegalAge() {
        return legalAge;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLegalAge(int legalAge) {
        this.legalAge = legalAge;
    }
}