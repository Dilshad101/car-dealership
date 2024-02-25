class Validation {
  static String? isEmpty(String input) {
    if (input.isEmpty) {
      return 'Field is empty';
    }
    return null;
  }
}
