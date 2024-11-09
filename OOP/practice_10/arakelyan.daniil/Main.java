package org.example;

import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.logging.*;

public class Main {

  public static FileHandler fh;

  private static final Logger logger = Logger.getLogger(Main.class.getName());
  static {
    SimpleFormatter formatter = new SimpleFormatter();
    try {
      fh = new FileHandler("app.logs");
      logger.addHandler(fh);
      fh.setFormatter(formatter);
      logger.setUseParentHandlers(false);
    } catch (IOException e) {
      logger.severe(e.getMessage());
    }
  }

  public static void main(String[] args) {

    logger.info("hellow from main");
    String path = "app/file.xml";
    BooksParser parser = new BooksParser();
    parser.loadAndParseFile(path);

    System.out.println("1 - print all authors");
    System.out.println("2 - print all books");
    System.out.println("3 - find by author");
    System.out.println("4 - find by name");
    System.out.println("5 - find by year");
    System.out.println("0 - exit");

    Scanner scanner = new Scanner(System.in);
    int state = 1;

    while (state != 0) {
      try {
        state = scanner.nextInt();
        switch (state) {
          case 1:
            parser.displayAllAuthors();
            break;
          case 2:
            parser.displayAllBooks();
            break;
          case 3:
            String name = scanner.next();
            parser.displayByAuthor(name);
            break;
          case 4:
            String title = scanner.next();
            parser.displayByTitle(title);
            break;
          case 5:
            int year = scanner.nextInt();
            parser.displayByYear(year);
            break;
        }
        if (state == 0) {
          System.out.println("GL!");
          return;
        }
      } catch (InputMismatchException e) {
        scanner.nextLine();
      }
    }
    scanner.close();
  }
}
