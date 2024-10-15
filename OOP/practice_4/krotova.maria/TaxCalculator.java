package taxes;

public class TaxCalculator {
    public double calculateTax(String type, int n) {
        Calculator calc = getCalculator(type);
        if (calc == null) {
            System.out.println("Unable to calculate: wrong type");
            return -1;
        }

        return calc.calculate(n);
    }

    private Calculator getCalculator(String type) {
        return switch (type) {
            case "ip" -> new IpCalculator();
            case "fiz" -> new FizCalculator();
            case "sam" -> new SamCalculator();
            default -> null;
        };
    }
}
