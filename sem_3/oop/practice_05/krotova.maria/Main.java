package amusementPark;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        if (args.length == 0) return;

        String type = args[0];
        User user;

        switch (type) {
            case "-v" -> {
                if (args.length == 2) {
                    Scanner s = new Scanner(args[1]);
                    if (s.hasNextInt()) {
                        user = new VirtualUser(s.nextInt());
                        user.makeFun();
                    } else System.err.println("user has no money");
                } else System.err.println("invalid arguments");
            }
            case "-u" -> {
                user = new RealUser();
                user.makeFun();
            }
            default -> System.out.println("no such user lol");
        }
    }
}
