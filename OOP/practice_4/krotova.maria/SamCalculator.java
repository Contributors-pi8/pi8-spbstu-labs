package taxes;

public class SamCalculator implements Calculator{
    @Override
    public double calculate(double n) {
        return n * 0.1;
    }
}
