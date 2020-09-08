class ValidationException implements Exception {
  final String code;
  final String message;

  ValidationException(this.code, this.message);

  @override
  String toString() => 'ValidationException(code: $code, message: $message)';

  factory ValidationException.cvv() =>
      ValidationException('105204', 'CVV_FORMAT_ERROR');

  factory ValidationException.expirationDateInThePast() =>
      ValidationException('105203', 'PAST_EXPIRY_DATE_ERROR');

  factory ValidationException.expirationDateFormat() =>
      ValidationException('105203', 'EXPIRY_DATE_FORMAT_ERROR');

  factory ValidationException.cardFormat() =>
      ValidationException('105202', 'CARD_NUMBER_FORMAT_ERROR');
}
