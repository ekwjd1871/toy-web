package toy.web.dajung.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginException extends Exception {
    private static final Logger logger = LoggerFactory.getLogger(LoginException.class);
    public static final String LOGIN_ERROR = "아이디 또는 비밀번호가 유효하지 않습니다";

    public LoginException() {
        logger.error("LoginException : " + LOGIN_ERROR);
    }
}
