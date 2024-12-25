package express;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {

    private static final Logger logger = LoggerFactory.getLogger(Main.class);

    public static void main(String[] args) {
        logger.info("starting");

        String name = "name1-name2.txt";

        try (BufferedReader reader = new BufferedReader(new FileReader(name))) {

            String buf = name.substring(0, name.lastIndexOf("."));
            String name1 = name.split("-")[0];
            String name2 = name.split("-")[1].substring(0, name.split("-")[1].lastIndexOf("."));
            logger.info("get names from file name: " + name1 + " " + name2);
            System.out.println(name1 + name2);

            logger.info("reading game stats from file");
            System.out.println("Player1: " + name1 + " - Player2: " + name2);

            String line;
            while ((line = reader.readLine()) != null) {
                logger.info("line from file: " + line);
                System.out.println(line);
            }
        } catch (IOException e) {
            logger.error("IOexception: " + e.getMessage());
        } catch (Exception e) {
            logger.error("Exception: " + e.getMessage());
        }
        logger.info("done");
    }
}