package pl.coderslab.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputValidator {
    public static final String EMAIL_VALIDATION_REGEX = "[_a-zA-z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}";
    public static final String PASSWORD_VALIDATION_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
    public static final String USERNAME_VALIDATION_REGEX = "^[a-zA-Z0-9](_(?!(\\.|_))|\\.(?!(_|\\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$";
    public static final Logger log = LogManager.getLogger(InputValidator.class);
    private static boolean validateString(String string, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(string);
        boolean isValid = matcher.matches();
        log.info("String: " + string + " is " + (isValid ? "valid" : "invalid"));
        return isValid;
    }

    public static boolean validateUser(String username, String email, String password) {
        return username != null
                && validateString(username, USERNAME_VALIDATION_REGEX)
                && email != null
                && validateString(email, EMAIL_VALIDATION_REGEX)
                && password != null
                && validateString(password, PASSWORD_VALIDATION_REGEX);
    }

    public static Integer parseInteger(String number) {
        Integer parsedNumber = null;
        try {
            parsedNumber = Integer.parseInt(number);
        } catch (NumberFormatException ignored) {
        }
        return parsedNumber;
    }
}
