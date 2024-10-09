package express;

public class User {

    int balance;
    int age;
    String type;
    int height;

    public User(int balance, int age, String type, int height) {
        this.balance = balance;
        this.age = age;
        this.type = type;
        this.height = height;
    }

    public int getBalance() {
        return balance;
    }

    public int getHeight() {
        return height;
    }

    public int getAge() {
        return age;
    }

    public String getType() {
        return type;
    }

    public void pay(int amount) {
        if (amount > balance) {
            throw new IllegalArgumentException("You do not have enough money");
        }
        balance -= amount;
    }
}
