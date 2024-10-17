import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.logging.*;

public class ReflectClass {
    private static final Logger logger = Logger.getLogger(ReflectClass.class.getName());
    static {
        SimpleFormatter formatter = new SimpleFormatter();
        try {
            FileHandler fh = new FileHandler("src/logger.txt"); // Не забудьте добавить logger.txt
            logger.addHandler(fh);
            fh.setFormatter(formatter);
            logger.setUseParentHandlers(false);
        } catch (IOException e) {
            logger.severe("иоехепншн");
        }
    }


    public static void main(String[] args){
        try {
            Class<?> targetClass = Class.forName("MethodClass");
            Object targetObject = targetClass.getDeclaredConstructor().newInstance();
            Method[] methods = targetClass.getDeclaredMethods();
            for (Method method : methods) {
                if (Modifier.isPrivate(method.getModifiers()) || Modifier.isProtected(method.getModifiers())) {
                    method.setAccessible(true);
                    method.invoke(targetObject);
                }
            }
        } catch (InvocationTargetException e) { //
            logger.severe("Ошибка в инвокатионе");
        } catch (IllegalAccessException e) { //
            logger.severe("Ошибка в ИллегалАкцессЕхепшн");
        } catch (ClassNotFoundException e) {
            logger.severe("Ошибка в классеНотФаунд");
        } catch (InstantiationException e) {
            logger.severe("ИнстантиалиатионЕхепшн");
        } catch (NoSuchMethodException e) {
            logger.severe("дурак");
        }
    }
}
