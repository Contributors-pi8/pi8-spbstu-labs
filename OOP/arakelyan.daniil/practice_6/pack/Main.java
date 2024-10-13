package pack;

// without logging

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {

  public static void main(String[] args) {
    String name = args[0];
    String buf = name.substring(0, name.lastIndexOf("."));
    String name1 = name.split("-")[0];
    String name2 = name.split("-")[1];
    System.out.println(name1 + name2);


    try (BufferedReader reader = new BufferedReader(new FileReader(name))) {
      System.out.println("Player1: " + name1 + " - Player2: " + name2);
      String line;
      while ((line = reader.readLine()) != null) {
        System.out.println(line);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}
