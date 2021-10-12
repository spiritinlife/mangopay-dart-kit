import 'package:mangopay_card/exceptions/mango_validation_exception.dart';
import 'package:mangopay_card/validators/validator_utils.dart';

class CvvValidator {
  static bool validate(String? cvv, String? cardType) {
    // this is the default card type https://docs.mangopay.com/endpoints/v2/cards#e181_the-card-object
    cardType = cardType ?? 'CB_VISA_MASTERCARD';

    if (cardType == "MAESTRO" || cardType == "BCMC") {
      return true;
    }

    cvv = cvv != null && cvv.isNotEmpty ? cvv.trim() : "";
    cardType = cardType.isNotEmpty ? cardType.trim() : "";

    // CVV is 3 to 4 digits for AMEX cards and 3 digits for all other cards
    if (ValidatorUtils.isNumeric(cvv)) {
      if ((cardType == "AMEX" && (cvv.length == 3 || cvv.length == 4)) ||
          (cardType == "CB_VISA_MASTERCARD" && cvv.length == 3)) {
        return true;
      }
    }

    // Invalid format
    throw MangoValidationException.cvv();
  }
}
