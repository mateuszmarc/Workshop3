package pl.coderslab.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InputValidator {
    public static boolean validateString(String string, String regex) {
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(string);
        return matcher.matches();
    }
}
