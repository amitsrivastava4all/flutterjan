import 'package:intl/intl.dart';

class Formatting {
  static String formatDate(DateTime date) {
    DateFormat obj = DateFormat("dd-MM-yyyy");
    return obj.format(date);
  }
}
