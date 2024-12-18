package express;

public class IpCalculator implements Calculator {

    @Override
    public double calculate(double a) {
        return a * 0.45;
    }
}
