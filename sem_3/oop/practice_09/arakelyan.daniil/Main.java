package org.example;

import java.io.IOException;
import java.util.logging.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import java.io.FileWriter;

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

    logger.info("Starting main");
    String path = "app/file.xml";

    try {
      File xmlFile = new File(path);
      logger.info("Get file " + path);
      DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
      DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
      logger.info("Parsing " + path + " file");
      Document doc = dBuilder.parse(xmlFile);

      NodeList list = doc.getElementsByTagName("book"); // get all elements by tag book.

      StringBuilder jsonString = new StringBuilder();
      jsonString.append("{ \n" +
          "\t\"books\": [{");

      for (int i = 0; i < list.getLength(); i++) {
        Element book = (Element) list.item(i);
        jsonString.append("\n\t\t\"book\": {\n");
        jsonString.append("\t\t\t\"ID\" : \"").append(book.getAttribute("id")).append("\",\n");
        jsonString.append("\t\t\t\"author\" : \"").append(book.getElementsByTagName("author").item(0).getTextContent()).append("\",\n");
        jsonString.append("\t\t\t\"name\" : \"").append(book.getElementsByTagName("name").item(0).getTextContent()).append("\",\n");
        jsonString.append("\t\t\t\"year\" : \"").append(book.getElementsByTagName("year").item(0).getTextContent()).append("\"\n");
        if (i != list.getLength() - 1) {
          jsonString.append("\t\t},");
        } else {
          jsonString.append("\t\t}");
        }
      }
      jsonString.append("\n\t}]\n");
      jsonString.append("}");

      try (FileWriter fileWriter = new FileWriter("file.json")) {
        logger.info("Writing file " + path + " to file.json");
        fileWriter.write(jsonString.toString());
      } catch (IOException e) {
        logger.severe(e.getMessage());
      }

    } catch (IOException | ParserConfigurationException | SAXException e) {
      logger.severe(e.getMessage());
    }
  }
}
