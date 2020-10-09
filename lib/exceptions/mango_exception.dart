import 'dart:convert';

class MangoException implements Exception {
  final String code;
  final String message;

  MangoException(this.code, this.message);

  @override
  String toString() => 'MangoException(code: $code, message: $message)';

  factory MangoException.token(String errorCode) =>
      MangoException(errorCode, 'Token processing error');

  factory MangoException.cardRegistration(String errorCode, String status) =>
      MangoException(errorCode, status);

  factory MangoException._fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MangoException(
      map['ResultCode'],
      map['ResultMessage'],
    );
  }

  factory MangoException.fromJson(String source) =>
      MangoException._fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangoException &&
        o.code == code &&
        o.message == message;
  }

  @override
  int get hashCode => code.hashCode ^ message.hashCode;
}
