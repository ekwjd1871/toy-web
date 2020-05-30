package toy.web.dajung.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

public class SessionUtils {
    private static final Logger logger = LoggerFactory.getLogger(SessionUtils.class);

    private static boolean isEmpty(HttpSession session, String key) {
        Object obj = session.getAttribute(key);
        if (obj == null) {
            return true;
        }
        return false;
    }

    public static Object getObjectValue(HttpSession session, String key) {
        if (isEmpty(session, key)) {
            return null;
        }

        return session.getAttribute(key);
    }

    public static String getStringValue(HttpSession session, String key) {
        if (isEmpty(session, key)) {
            return null;
        }

        return (String) session.getAttribute(key);
    }
}
