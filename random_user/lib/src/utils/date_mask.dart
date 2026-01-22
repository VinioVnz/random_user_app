import 'package:intl/intl.dart';

class DateMask {
  static String format(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
