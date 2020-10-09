import 'dart:convert';

class MangoValidationException implements Exception {
  final String code;
  final String message;

  MangoValidationException(this.code, this.message);

  @override
  String toString() =>
      'MangoValidationException(code: $code, message: $message)';

  factory MangoValidationException.cvv() =>
      MangoValidationException('105204', 'CVV_FORMAT_ERROR');

  factory MangoValidationException.expirationDateInThePast() =>
      MangoValidationException('105203', 'PAST_EXPIRY_DATE_ERROR');

  factory MangoValidationException.expirationDateFormat() =>
      MangoValidationException('105203', 'EXPIRY_DATE_FORMAT_ERROR');

  factory MangoValidationException.cardFormat() =>
      MangoValidationException('105202', 'CARD_NUMBER_FORMAT_ERROR');

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangoValidationException &&
        o.code == code &&
        o.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}
