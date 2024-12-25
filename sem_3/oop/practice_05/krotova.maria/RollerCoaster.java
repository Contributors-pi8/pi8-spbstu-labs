package amusementPark;

import java.util.Random;

public class RollerCoaster extends Attraction{
    public RollerCoaster(){
        this.setPrice(10);
    }
    private int diceSimulator() {
        Random rand = new Random();
        return rand.nextInt(20) + 1;
    }
    @Override
    protected void ride() {
        System.out.println(diceSimulator() <= 1 ? "u are dead lol xD xD xD" : "roller coaster wooah!");
    }
}
