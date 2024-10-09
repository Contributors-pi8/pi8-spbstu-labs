package express;

public class HauntedHouse extends Attraction {

    private int minAge = 12;
    private int minHeight = 150;

    public HauntedHouse() {
        super(15);
    }

    public boolean checkAge(int age) {
        return age >= minAge;
    }

    public boolean checkHeight(int height) {
        return height >= minHeight;
    }

    public void startSession(User user) {
        if (checkHeight(user.height) && checkAge(user.age) && this.enter(user)) {
            System.out.println("starting session in the HAUNTED HOUSE! booooooo (0_0)");
        }
        else {
            System.out.println("sorry, but you are poor guy without money! you cant start the session on the HAUNTED HOUSE!");
        }
    }
}
