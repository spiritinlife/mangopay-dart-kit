import 'package:flutter_test/flutter_test.dart';
import 'package:mangopay_card/exceptions/mango_validation_exception.dart';
import 'package:mangopay_card/validators/card_validator.dart';
import 'package:mangopay_card/validators/cvv_validator.dart';
import 'package:mangopay_card/validators/expiration_date_validator.dart';
import 'package:mangopay_card/validators/validator_utils.dart';

void main() {
  test(
      " validateNumericOnly method should return true if cc ontains more than 1 digit",
      () {
    expect(ValidatorUtils.isNumeric(""), false);
    expect(ValidatorUtils.isNumeric("0123456789"), true);
    expect(ValidatorUtils.isNumeric("01234WW56789"), false);
    expect(ValidatorUtils.isNumeric("_1234"), false);
    expect(ValidatorUtils.isNumeric("12 34"), false);
  });

  test(" validateCheckDigit should return true if cc has valid check digit",
      () {
    expect(CardValidator.validateCheckDigit("4929225063451102"), false);
    expect(CardValidator.validateCheckDigit("5585842253289145"), false);
    expect(CardValidator.validateCheckDigit("4929225063451101"), true);
    expect(CardValidator.validateCheckDigit("5585842253289141"), true);
    expect(CardValidator.validateCheckDigit("6011624267989581"), true);
    expect(CardValidator.validateCheckDigit("372723172231463"), true);
  });

  test(" CVVNumberValidator should return true if cc length is valid", () {
    expect(() => CvvValidator.validate("12", "AMEX"),
        throwsA(MangoValidationException.cvv()));
    expect(CvvValidator.validate("123", "AMEX"), true);
    expect(CvvValidator.validate("9999", "AMEX"), true);
    expect(CvvValidator.validate("123", "CB_VISA_MASTERCARD"), true);
    expect(() => CvvValidator.validate("1234", "CB_VISA_MASTERCARD"),
        throwsA(MangoValidationException.cvv()));
    expect(() => CvvValidator.validate("12", "CB_VISA_MASTERCARD"),
        throwsA(MangoValidationException.cvv()));
    expect(() => CvvValidator.validate("12345", "CB_VISA_MASTERCARD"),
        throwsA(MangoValidationException.cvv()));
    expect(() => CvvValidator.validate("asd", "CB_VISA_MASTERCARD"),
        throwsA(MangoValidationException.cvv()));
    expect(() => CvvValidator.validate("", "CB_VISA_MASTERCARD"),
        throwsA(MangoValidationException.cvv()));
  });

  test(
      " ExpirationDateValidator should return false if format of DateTime is incorrect",
      () {
    expect(() => ExpirationDateValidator.validate("123", DateTime.now()),
        throwsA(MangoValidationException.expirationDateFormat()));
    expect(() => ExpirationDateValidator.validate("1999", DateTime.now()),
        throwsA(MangoValidationException.expirationDateFormat()));
    // expect(() => ExpirationDateValidator.validate("1210", DateTime.now()),
    //     throwsA(MangoValidationException.expirationDateFormat()));
    expect(() => ExpirationDateValidator.validate("2222", DateTime.now()),
        throwsA(MangoValidationException.expirationDateFormat()));
    expect(() => ExpirationDateValidator.validate("a622", DateTime.now()),
        throwsA(MangoValidationException.expirationDateFormat()));
    expect(() => ExpirationDateValidator.validate("", DateTime.now()),
        throwsA(MangoValidationException.expirationDateFormat()));
  });

  test(
      " ExpirationDateTimeValidator should return false if mmyy DateTime is in the past",
      () {
    expect(() => ExpirationDateValidator.validate("0214", DateTime(2014, 3, 1)),
        throwsA(MangoValidationException.expirationDateInThePast()));
    expect(() => ExpirationDateValidator.validate("0313", DateTime(2014, 2, 1)),
        throwsA(MangoValidationException.expirationDateInThePast()));
  });

  test(
      " ExpirationDateTimeValidator should return true if mmyy DateTime is in future",
      () {
    expect(
        ExpirationDateValidator.validate("1234", DateTime(2014, 0, 1)), true);
    expect(
        ExpirationDateValidator.validate("1123", DateTime(2014, 0, 1)), true);
    expect(
        ExpirationDateValidator.validate("0120", DateTime(2014, 0, 1)), true);
    expect(
        ExpirationDateValidator.validate("1219", DateTime(2014, 0, 1)), true);
    expect(
        ExpirationDateValidator.validate("0214", DateTime(2014, 1, 28)), true);
    expect(
        ExpirationDateValidator.validate("0314", DateTime(2014, 2, 1)), true);
    expect(
        ExpirationDateValidator.validate("0314", DateTime(2014, 2, 31)), true);
    expect(
        ExpirationDateValidator.validate("0315", DateTime(2014, 2, 1)), true);
  });
}
