package amusementPark;

import java.util.Random;

public class VirtualUser extends User{
    private int wallet;
    public VirtualUser(int money){
        wallet = money;
    }

    private static Attraction findMin(Attraction[] attractions) {
        Attraction minPricedAttr = null;
        int minPrice = Integer.MAX_VALUE;
        for (Attraction a : attractions) {
            if (a.getPrice() < minPrice) {
                minPrice = a.getPrice();
                minPricedAttr = a;
            }
        }
        return minPricedAttr;
    }

    @Override
    public void makeFun() {
        Random random = new Random();
        int atrNum = random.nextInt(3);
        Attraction[] attractions = {new RollerCoaster(), new Carousel(), new FuturamaCab()};
        Attraction minPricedAttr = findMin(attractions);
        int attrPrice;

        while (wallet > minPricedAttr.getPrice()) {
            attrPrice = attractions[atrNum].getPrice();

            if (wallet > attrPrice) {
                attractions[atrNum].ride();
                wallet -= attrPrice;
            } else if (wallet > minPricedAttr.getPrice()) {
                minPricedAttr.ride();
                wallet -= minPricedAttr.getPrice();
            } else if (attractions[2].getPrice() == 0) {
                attractions[2].ride();
            }
            atrNum = random.nextInt(3);
        }
        System.out.println("out of money :(");
    }
}
