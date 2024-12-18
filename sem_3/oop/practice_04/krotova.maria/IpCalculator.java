package taxes;

public class IpCalculator implements Calculator{
    @Override
    public double calculate(double n) {
        return n * 0.45;
    }
}
