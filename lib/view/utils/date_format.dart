class DateFormat {
  static String convertToDate(String dateStr) {
    return dateStr.toString().replaceAll("T", " ").substring(0, 19);
  }
}
