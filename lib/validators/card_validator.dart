import 'package:mangopay_card/exceptions/mango_validation_exception.dart';
import 'package:mangopay_card/validators/validator_utils.dart';

class CardValidator {
  static bool validate(String? cardNumber) {
    cardNumber =
        cardNumber != null && cardNumber.isNotEmpty ? cardNumber.trim() : "";

    if (ValidatorUtils.isNumeric(cardNumber) &&
        CardValidator.validateCheckDigit(cardNumber)) return true;

    throw MangoValidationException.cardFormat();
  }

  // From https://stackoverflow.com/questions/12310837/implementation-of-luhn-algorithm
  static bool validateCheckDigit(String cardNumber) {
    String sanitized = cardNumber.replaceAll(new RegExp(r'[^0-9]+'), '');

    // Luhn algorithm
    int sum = 0;
    String digit;
    bool shouldDouble = false;

    for (int i = sanitized.length - 1; i >= 0; i--) {
      digit = sanitized.substring(i, (i + 1));
      int tmpNum = int.parse(digit);

      if (shouldDouble == true) {
        tmpNum *= 2;
        if (tmpNum >= 10) {
          sum += ((tmpNum % 10) + 1);
        } else {
          sum += tmpNum;
        }
      } else {
        sum += tmpNum;
      }
      shouldDouble = !shouldDouble;
    }

    return (sum % 10 == 0);
  }
}
