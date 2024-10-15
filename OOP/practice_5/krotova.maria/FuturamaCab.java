package amusementPark;

public class FuturamaCab extends Attraction {
    private int count = 0;
    private static final int REGULAR_PRICE = 5;
    public FuturamaCab(){
        setPrice(REGULAR_PRICE);
    }

    private void visit() {
        count++;
        if (count == 100) {
            setPrice(0);
            System.out.println("u are the hundredth visitor!\nu can use Futurama Cab for free once!");
        }
        else setPrice(REGULAR_PRICE);
    }
    @Override
    protected void ride() {
        visit();
        System.out.println("u tried to die already " + count + " times lol");
    }
}
