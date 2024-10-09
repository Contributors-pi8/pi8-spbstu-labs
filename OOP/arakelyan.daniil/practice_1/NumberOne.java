package express;

import java.util.Scanner;

public class NumberOne {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        int number;

        if (args.length != 0) {
            try {
                number = Integer.parseInt(args[0]);
                parse(number);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else if (scan.hasNextInt()) {
            number = scan.nextInt();
            parse(number);
        } else {
            System.out.println("Please enter a number in next time");
        }

    }

    private static void parse(int number) {

        while (number > 10) {
            int f = number / 10;
            int s = number % 10;
            number = f + s;
            if (f + s < 10) {
                System.out.println(f + s);
            }
        }
    }

}