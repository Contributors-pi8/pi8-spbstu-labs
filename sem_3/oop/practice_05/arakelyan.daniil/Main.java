package express;


import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        String userType;
        int money;
        AttractionPark park = new AttractionPark();

        if (args.length != 0) {
            userType = args[0];
            if (userType.equals("V")) {
                try {
                    money = Integer.parseInt(args[1]);
                    virtUser(park, money);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else if (userType.equals("U")) {
                realUser(park);
            }
        } else {
            System.err.println("there are no command line arguments!");
        }

    }

    public static void realUser(AttractionPark park) {
        Scanner scanner = new Scanner(System.in);
        String command = scanner.nextLine();

        User virtUser = new User(0, 15, "U", 160);
        while (!command.equals("Exit")) {
            try {
                park.chooseAttraction(virtUser, command);
            } catch (IllegalArgumentException e) {
                System.err.println("there are no attraction with this name: " + command);
            }
            command = scanner.nextLine();
        }

    }

    public static void virtUser(AttractionPark park, int money) {
        User virtUser = new User(money, 15, "V", 160);
        var names = park.getParkAttractionsNames();

        while (virtUser.getBalance() > 0) {
            for (var attractions : names) {
                park.chooseAttraction(virtUser, attractions);
            }
        }

    }
}