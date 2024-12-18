package express;

public class ClassWithMethods {

    public ClassWithMethods() {}

    public void getOne() {
        System.out.println("getOne method");
    }

    private void getTwo(String str) {
        System.out.println("getTwo method + param = " + str);
    }

    protected void getThree(Integer someNum) {
        System.out.println("getThree method + param = " + someNum);
    }

    void getSomeFour() {
        System.out.println("get Defauld method");
    }
}
