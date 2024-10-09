package express;

import com.sun.source.tree.LiteralTree;

import java.util.*;

public class NumberTwo {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        Vector<Integer> numbers = new Vector<>();
        Collections.sort(numbers);

        if (args.length != 0 && args.length > 3) {
            int a = 0;
            while (a != args.length) {
                numbers.add(Integer.parseInt(args[a]));
                a++;
            }

            findDifNumber(numbers);
        } else {
            while (scan.hasNextInt()) {
                int number = scan.nextInt();
                numbers.add(number);
            }

            findDifNumber(numbers);
        }
    }


    private static void findDifNumber(Vector<Integer> numbers) {
        int counter = 0;
        for (int i = 0; i < numbers.size(); i++) {
            for (int j = 0; j < numbers.size(); j++) {
                if (j == i)
                {
                    continue;
                }
                if (numbers.get(i).equals(numbers.get(j))) {
                    ++counter;
                }
            }
            if (counter == 0)
            {
                System.out.println(numbers.get(i));
            }
            else {
                counter = 0;
            }
        }
    }
}
