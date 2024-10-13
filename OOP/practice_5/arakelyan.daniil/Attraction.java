package express;

public abstract class Attraction {

    private int cost;

    public Attraction(int cost) {
        this.cost = cost;
    }

    public boolean enter(User user) {
        if (user.type.equals("V")) {
            try {
                user.pay(cost);
            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }

    public void startSession(User user) {}
}
