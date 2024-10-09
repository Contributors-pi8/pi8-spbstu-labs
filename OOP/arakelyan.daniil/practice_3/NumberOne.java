
import java.util.HashMap;


class NumberOne
{
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);

    Vector<Integer> numbers = new Vector<>();

    if (args.length != 0 && args.length > 3) {
      int a = 0;
      while (a != args.length) {
        numbers.add(Integer.parseInt(args[a]));
        a++;
      }

      var answ = findDifNumber(numbers);
      System.out.println(answ);
    }
    // } else {
    //   while (scan.hasNext()) {
    //     if (scan.hasNextInt()) {
    //       int number = scan.nextInt();
    //       numbers.add(number);
    //     }
    //
    //   }
    //
    //
    // }
  }

  private static String findDifNumber(Vector<String> numbers) {

    for (int i = 0; i < numbers.size(); i++) {
      String cur = numbers.elementAt(i);
      for (int j = i + 1; j < numbers.size(); j++) {
        if (!cur.equals(numbers.elementAt(j))) {
          return numbers.elementAt(j);
        }
      }
    }
    return null;
  }
}
