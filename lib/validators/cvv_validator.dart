
import 'package:mangopay_card/exceptions/validation_exception.dart';
import 'package:mangopay_card/validators/validator_utils.dart';


class CvvValidator {

  static bool validate(String cvv, String cardType) {
    if (cardType == "MAESTRO" || cardType == "BCMC") {
      return true;
    }
    cvv = cvv.isNotEmpty ? cvv.trim() : "";
    cardType = cardType.isNotEmpty ? cardType.trim() : "";

    // CVV is 3 to 4 digits for AMEX cards and 3 digits for all other cards
    if (ValidatorUtils.isNumeric(cvv) == true) {
      if ((cardType == "AMEX" && (cvv.length == 3 || cvv.length == 4)) ||
          (cardType == "CB_VISA_MASTERCARD" && cvv.length == 3)) {
        return true;
      }
    }

    // Invalid format
    throw ValidationException.cvv();
  }
}
