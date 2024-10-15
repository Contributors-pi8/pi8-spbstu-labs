package taxes;

public class FizCalculator implements Calculator{
    @Override
    public double calculate(double n) {
        return n * 0.35;
    }
}
