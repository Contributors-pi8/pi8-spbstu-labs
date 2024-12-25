package express;

public class SamCalculator implements Calculator {

    @Override
    public double calculate(double a) {
        return a * 0.1;
    }
}
