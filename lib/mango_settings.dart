import 'dart:convert';

class MangoSettings {
  final String baseURL;
  final String clientId;
  final String cardPreregistrationId;

  final String cardRegistrationURL;
  final String preregistrationData;
  final String accessKey;

  MangoSettings({
    required this.baseURL,
    required this.clientId,
    required this.cardPreregistrationId,
    required this.cardRegistrationURL,
    required this.preregistrationData,
    required this.accessKey,
  });

  @override
  String toString() {
    return 'MangoSettings(baseURL: $baseURL, clientId: $clientId, cardPreregistrationId: $cardPreregistrationId, cardRegistrationURL: $cardRegistrationURL, preregistrationData: $preregistrationData, accessKey: $accessKey)';
  }

  Map<String, dynamic> toMap() {
    return {
      'baseURL': baseURL,
      'clientId': clientId,
      'cardPreregistrationId': cardPreregistrationId,
      'cardRegistrationURL': cardRegistrationURL,
      'preregistrationData': preregistrationData,
      'accessKey': accessKey,
    };
  }

  factory MangoSettings.fromMap(Map<String, dynamic> map) {
    return MangoSettings(
      baseURL: map['baseURL'],
      clientId: map['clientId'],
      cardPreregistrationId: map['cardPreregistrationId'],
      cardRegistrationURL: map['cardRegistrationURL'],
      preregistrationData: map['preregistrationData'],
      accessKey: map['accessKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MangoSettings.fromJson(String source) =>
      MangoSettings.fromMap(json.decode(source));

  MangoSettings copyWith({
    String? baseURL,
    String? clientId,
    String? cardPreregistrationId,
    String? cardRegistrationURL,
    String? preregistrationData,
    String? accessKey,
  }) {
    return MangoSettings(
      baseURL: baseURL ?? this.baseURL,
      clientId: clientId ?? this.clientId,
      cardPreregistrationId:
          cardPreregistrationId ?? this.cardPreregistrationId,
      cardRegistrationURL: cardRegistrationURL ?? this.cardRegistrationURL,
      preregistrationData: preregistrationData ?? this.preregistrationData,
      accessKey: accessKey ?? this.accessKey,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangoSettings &&
        o.baseURL == baseURL &&
        o.clientId == clientId &&
        o.cardPreregistrationId == cardPreregistrationId &&
        o.cardRegistrationURL == cardRegistrationURL &&
        o.preregistrationData == preregistrationData &&
        o.accessKey == accessKey;
  }

  @override
  int get hashCode {
    return baseURL.hashCode ^
        clientId.hashCode ^
        cardPreregistrationId.hashCode ^
        cardRegistrationURL.hashCode ^
        preregistrationData.hashCode ^
        accessKey.hashCode;
  }
}
