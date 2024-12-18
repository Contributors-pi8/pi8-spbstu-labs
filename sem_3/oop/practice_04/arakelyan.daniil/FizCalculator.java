package express;

public class FizCalculator implements Calculator {

    @Override
    public double calculate(double a) {
        return a * 0.35;
    }
}
