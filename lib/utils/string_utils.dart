bool isEmpty(String s) {
  return s == null || s.isEmpty;
}

bool isNotEmpty(String s) {
  return !isEmpty(s);
}

bool isValidEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (email.length == 0) {
    return false;
  }
  return regExp.hasMatch(email);
}

class StringUtils {
  static String replace(String s, String replace, String newValue) {
    if (s != null && s.isNotEmpty) {
      return s.replaceAll(replace, newValue);
    }
    return s;
  }
}

