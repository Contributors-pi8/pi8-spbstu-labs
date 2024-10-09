package express;

public class TaxCalculator {

    public TaxCalculator() {
        super();
    }

    public double calculateTax(String name, int money) {
        return getCalculator(name).calculate(money);
    }

    private Calculator getCalculator(String orgName) {
        if (orgName.equals("FIZ")) {
            return new FizCalculator();
        } else if (orgName.equals("IP")) {
            return new IpCalculator();
        }
        return new SamCalculator();
    }
}
