package org.example;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import static org.example.Main.fh;

public class BooksParser {

  private static final Logger logger = Logger.getLogger(BooksParser.class.getName());
  static {
    SimpleFormatter formatter = new SimpleFormatter();
    logger.addHandler(fh);
    fh.setFormatter(formatter);
    logger.setUseParentHandlers(false);
  }

  List<Book> books = new ArrayList<>();

  public void loadAndParseFile(String path) {
    logger.info("Starting parsing books from: " + path);

    File xmlFile = new File(path);

    try {
      DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
      Document doc = dBuilder.parse(xmlFile);

      NodeList nList = doc.getElementsByTagName("book");

      for (int i = 0; i < nList.getLength(); i++) {
        Element book = (Element) nList.item(i);
        String name = book.getElementsByTagName("name").item(0).getTextContent();
        String author = book.getElementsByTagName("author").item(0).getTextContent();
        int year = Integer.parseInt(book.getElementsByTagName("year").item(0).getTextContent());
        books.add(new Book(name, author, year));
      }

    } catch (IOException | ParserConfigurationException | SAXException e) {
      logger.severe("Error: " + e.getMessage());
    }
  }

  public void displayAllAuthors() {
    books.stream()
        .map(Book::getAuthor)
        .distinct()
        .forEach(System.out::println);
  }

  public void displayAllBooks() {
    books.stream()
        .map(Book::getTitle)
        .distinct()
        .forEach(System.out::println);
  }

  public void displayByAuthor(String author) {
    books.stream()
        .map(book -> book.getAuthor().equalsIgnoreCase(author) ? book : null)
        .distinct()
        .forEach(System.out::println);
  }

  public void displayByTitle(String title) {
    books.stream()
        .map(book -> book.getTitle().equalsIgnoreCase(title) ? book : null)
        .distinct()
        .forEach(System.out::println);
  }

  public void displayByYear(int year) {
    books.stream()
        .map(book -> book.getYear() == year ? book : null)
        .distinct()
        .forEach(System.out::println);
  }
}
