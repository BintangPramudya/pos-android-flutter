import 'package:intl/intl.dart';

class NumberHelper {
  static String formatNumber(int param, String format) {
    return NumberFormat(format, 'id').format(param);
  }

  static String formatIdr(int param) {
    return 'Rp.${NumberFormat('#,###', 'id').format(param)}';
  }
}
