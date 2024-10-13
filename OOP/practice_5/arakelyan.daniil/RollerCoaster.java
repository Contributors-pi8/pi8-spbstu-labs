package express;

public class RollerCoaster extends Attraction {

    private int minAge = 10;

    public RollerCoaster() {
        super(10);
    }

    public boolean checkAge(int age) {
        return age >= minAge;
    }

    public void startSession(User user) {
        if (checkAge(user.age) && this.enter(user)) {
            System.out.println("starting session on ther roller coaster! yaaaaaaaaaaaaaa (')_(')");
        }
        else {
            System.out.println("sorry, but you are poor guy without money! you cant start the session on the ROLLER COASTER!");
        }
    }
}
