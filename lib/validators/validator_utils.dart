class ValidatorUtils {
  static bool isNumeric(String s) => double.parse(s, (e) => null) != null;
}
