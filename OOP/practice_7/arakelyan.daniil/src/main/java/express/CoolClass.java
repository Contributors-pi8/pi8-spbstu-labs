package express;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class CoolClass {

    private static final Logger logger = LogManager.getLogger(CoolClass.class);

    public void getAllMethodsFromSomeClass(String className) {

        try {
            logger.info("starting creating methods from some class");

            Class someClass = Class.forName(className);
            Object instanse = someClass.getDeclaredConstructor().newInstance();
            Method[] methods = someClass.getDeclaredMethods();

            for (var method : methods) {
                if (Modifier.isPrivate(method.getModifiers()) || Modifier.isProtected(method.getModifiers())) {
                    logger.info("invoking method " + method.getName());

                    method.setAccessible(true);
                    Class[] parameterTypes = method.getParameterTypes();
                    if (parameterTypes.length != 0) {

                        Object[] args = new Object[parameterTypes.length];
                        for (int i = 0; i < parameterTypes.length; i++) {
                            args[i] = getDefaultValue(parameterTypes[i]);
                        }
                        method.invoke(instanse, args);
                    } else {
                        method.invoke(instanse);
                    }
                }
//                else {
//                    method.invoke(instanse); // uncomment if you wanna see "open" methods also
//                }
                method.setAccessible(false);

            }
        } catch (ClassNotFoundException | IllegalArgumentException | InvocationTargetException | IllegalAccessException | SecurityException | NoSuchMethodException e) {
            logger.error(e);
        } catch (InstantiationException e) {
            logger.error(e);
        }

        logger.info("end of function that creating methods from some class");
    }

    private Object getDefaultValue(Class type) {
        if (type.isPrimitive()) {
            if (type == boolean.class) return false;
            if (type == char.class) return '\u0000';
            if (type == byte.class) return (byte) 0;
            if (type == short.class) return (short) 0;
            if (type == int.class) return 0;
            if (type == long.class) return 0L;
            if (type == float.class) return 0.0f;
            if (type == double.class) return 0.0d;
        }
        return null;
    }
}
