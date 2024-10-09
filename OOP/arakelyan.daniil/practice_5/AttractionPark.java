package express;

import java.util.ArrayList;
import java.util.List;

public class AttractionPark {

    private Attraction attraction;
    private List< String > names = new ArrayList<>();

    public AttractionPark() {
        names.add("Wheel");
        names.add("Roller Coaster");
        names.add("Haunted House");
    }

    public List< String > getParkAttractionsNames() {
        return names;
    }

    public void chooseAttraction(User user, String name) {
        if (!names.contains(name)) {
            throw new IllegalArgumentException("No such attraction: " + name);
        }
        attraction(name).startSession(user);
    }

    public Attraction attraction(String name) {
        if (name.equals("Wheel")) {
            attraction = new BigWheel();
        } else if (name.equals("Roller Coaster")) {
            attraction = new RollerCoaster();
        } else if (name.equals("Haunted House")) {
            attraction = new HauntedHouse();
        }
        return attraction;
    }
}
