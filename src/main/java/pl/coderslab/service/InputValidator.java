package pl.coderslab.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputValidator {
    public static final Logger log = LogManager.getLogger(InputValidator.class);
    public static boolean validateString(String string, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(string);
        boolean isValid = matcher.matches();
        log.info("String: " + string + " is " + (isValid ? "valid" : "invalid"));
        return isValid;
    }
}
