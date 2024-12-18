public class Main {
    public static void main(String[] args) {
        String s = "";
        if (args.length != 0) {
            s = args[0];
        } else {
            Scanner scan = new Scanner(System.in);
            s = scan.nextLine();
        }

        char[] letters = s.toCharArray();
        HashMap<Character, Integer> result = new HashMap<>();
        for (char c : letters) {
            if (!Character.isDigit(c)) {
                if (!result.containsKey(c)) {
                    result.put(c, 1);
                }
                else result.put(c, result.get(c) + 1);
            }
        }

        System.out.println(result.toString());
    }
}