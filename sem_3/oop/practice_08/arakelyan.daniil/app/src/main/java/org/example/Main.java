package org.example;

import java.io.IOException;

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
    logger.info("Starting in main");
    if (args.length == 0) {
      logger.severe("no file path!");
      return;
    }
    String path = args[0];
    SaveData dataSaver = new SaveData();
    dataSaver.writer(path);
  }
}
