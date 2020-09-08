import 'dart:convert';

class ApiException implements Exception {
  final String code;
  final String message;

  ApiException(this.code, this.message);

  @override
  String toString() => 'ApiException(code: $code, message: $message)';

  factory ApiException.token(String errorCode) =>
      ApiException(errorCode, 'Token processing error');

  factory ApiException.cardRegistration(String errorCode, String status) => ApiException(errorCode, status);

  factory ApiException.unknown(String message) => ApiException('-1', message);


  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
    };
  }

  factory ApiException.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ApiException(
      map['ResultCode'],
      map['ResultMessage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiException.fromJson(String source) =>
      ApiException.fromMap(json.decode(source));
}
