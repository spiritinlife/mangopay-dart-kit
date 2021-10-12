import 'package:mangopay_card/exceptions/mango_validation_exception.dart';
import 'package:mangopay_card/validators/validator_utils.dart';

class ExpirationDateValidator {
  static bool validate(String? cardDate, DateTime currentDate) {
    cardDate = cardDate != null && cardDate.isNotEmpty ? cardDate.trim() : "";

    // Requires 2 digit for month and 2 digits for year
    if (cardDate.length == 4 && ValidatorUtils.isNumeric(cardDate)) {
      var month = int.parse(cardDate.substring(0, 2), radix: 10);
      var year = int.parse(cardDate.substring(2), radix: 10) + 2000;

      if (month > 0 && month <= 12) {
        var currentYear = currentDate.year;
        if (currentYear < year) return true;

        if (currentYear == year) {
          var currentMonth = currentDate.month;
          if (currentMonth <= month) return true;
        }

        // Date is in the past
        throw MangoValidationException.expirationDateInThePast();
      }
    }

    // Date does not look correct
    throw MangoValidationException.expirationDateFormat();
  }
}
