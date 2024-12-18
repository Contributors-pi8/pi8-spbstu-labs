package express;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class NumberT {
    public static void main(String[] args) {

        String std = "asdasd";

        Scanner scan = new Scanner(System.in);
        if (args.length != 0 && args.length > 3) {
            std = args[0];
        } else {
            std = scan.nextLine();
        }
        Map< Character, Integer> map = new HashMap<>();
        for (char c : std.toCharArray()) {
            map.put(c, map.getOrDefault(c, 0) + 1);
        }
        for (Map.Entry entry : map.entrySet()) {
            System.out.println(entry.getKey() + " " + entry.getValue());
        }
    }
}
