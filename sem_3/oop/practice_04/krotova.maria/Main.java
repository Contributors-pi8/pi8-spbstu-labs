package taxes;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String type = scanner.next();
        int money = scanner.nextInt();

        TaxCalculator taxCalculator = new TaxCalculator();
        System.out.println(taxCalculator.calculateTax(type, money));
    }
}
