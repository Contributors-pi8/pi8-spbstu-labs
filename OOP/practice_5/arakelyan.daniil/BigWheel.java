package express;

public class BigWheel extends Attraction {

    public BigWheel() {
        super(1);
    }

    public void startSession(User user) {
        if (this.enter(user)) {
            System.out.println("starting session on ther big wheel! chill (-_-)");
        }
        else {
            System.out.println("sorry, but you are poor guy without money! you cant start the session on the BIG AMAZING ULTRA COOL WHEEEEEEL!");
        }
    }
}
