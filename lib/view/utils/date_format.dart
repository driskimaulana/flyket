class DateFormat {
  static String convertToDate(dynamic dateStr) {
    return dateStr.toString().replaceAll("T", " ").substring(0, 19);
  }
}
