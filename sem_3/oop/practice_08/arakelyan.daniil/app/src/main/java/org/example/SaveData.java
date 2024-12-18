package org.example;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;

import org.json.*;

import java.lang.reflect.Method;
import java.util.Random;
import java.util.logging.SimpleFormatter;

public class SaveData {

  private static final java.util.logging.Logger logger = java.util.logging.Logger.getLogger(Data.class.getName());
  static {
    SimpleFormatter formatter = new SimpleFormatter();
    logger.addHandler(Main.fh);
    Main.fh.setFormatter(formatter);
    logger.setUseParentHandlers(false);
  }

  public void writer(String path) {
    logger.info("In writer method");
    try {
      Class<?> someClass = Class.forName(Data.class.getName());
      Field[] fields = someClass.getDeclaredFields();
      writerInFile(fields, someClass, path);

    } catch (ClassNotFoundException | IllegalAccessException | JSONException | IOException e) {
      logger.severe(e.getMessage());
    }
  }

  private void writerInFile(Field[] f, Class<?> cl, String path)
      throws IllegalAccessException, JSONException, IOException {
    JSONArray jsonArray = new JSONArray();
    for (var field : f) {
      field.setAccessible(true);
      JSONObject obj = new JSONObject();
      if (field.isAnnotationPresent(Ok.class)) {
        obj.put(field.getName(), field.get(new Data()));
        jsonArray.put(obj);
      } else if (field.isAnnotationPresent(Ugly.class)) {
        Random rn = new Random();
        Method[] m = Ugly.class.getDeclaredMethods();
        Object val = m[0].getDefaultValue();
        obj.put(field.getName(), rn.nextInt((Integer) val * -1, (Integer) val * 1));
        jsonArray.put(obj);
      } else {
        Object value = field.get(new Data());
        String name = field.getName();
        System.out.println(name + ":" + value);
        logger.severe(name + ":" + value);
      }
      field.setAccessible(false);
    }
    FileWriter fileWriter = new FileWriter(path);
    fileWriter.write("{\n");
    for (int i = 0; i < jsonArray.length(); i++) {
      String st = jsonArray.get(i).toString().replace("{", "").replace("}", "");
      fileWriter.write("  " + st);
      if (i != jsonArray.length() - 1) {
        fileWriter.write(",\n");
      } else {
        fileWriter.write("\n");
      }
    }
    fileWriter.write("}\n");
    fileWriter.flush();
    fileWriter.close();
  }
}
