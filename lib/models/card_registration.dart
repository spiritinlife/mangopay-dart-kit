import 'dart:convert';

class CardRegistration {
  // Card registration id
  final String id;
  // Custom data
  final String? tag;
  // The creation date of the object
  final double creationDate;
  // ID of the credited user (owner of the credited wallet)
  final String userId;
  final String accessKey;
  final String preregistrationData;
  final String registrationData;
  // The ID of the registered card (Got through CardRegistration object)
  final String cardId;
  final String cardType;
  final String cardRegistrationURL;
  /*
  * The status of the payment:
  * « CREATED » (the object is created),
  * « SUCCEEDED » (the payment is succeeded),
  * « FAILED » (the payment has failed).
  */
  final String status;
  // The transaction result code
  final String resultCode;
  // The transaction result Message
  final String resultMessage;
  final String currency;

  CardRegistration({
    required this.id,
    required this.tag,
    required this.creationDate,
    required this.userId,
    required this.accessKey,
    required this.preregistrationData,
    required this.registrationData,
    required this.cardId,
    required this.cardType,
    required this.cardRegistrationURL,
    required this.status,
    required this.resultCode,
    required this.resultMessage,
    required this.currency,
  });

  CardRegistration copyWith({
    String? id,
    String? tag,
    double? creationDate,
    String? userId,
    String? accessKey,
    String? preregistrationData,
    String? registrationData,
    String? cardId,
    String? cardType,
    String? cardRegistrationURL,
    String? status,
    String? resultCode,
    String? resultMessage,
    String? currency,
  }) {
    return CardRegistration(
      id: id ?? this.id,
      tag: tag ?? this.tag,
      creationDate: creationDate ?? this.creationDate,
      userId: userId ?? this.userId,
      accessKey: accessKey ?? this.accessKey,
      preregistrationData: preregistrationData ?? this.preregistrationData,
      registrationData: registrationData ?? this.registrationData,
      cardId: cardId ?? this.cardId,
      cardType: cardType ?? this.cardType,
      cardRegistrationURL: cardRegistrationURL ?? this.cardRegistrationURL,
      status: status ?? this.status,
      resultCode: resultCode ?? this.resultCode,
      resultMessage: resultMessage ?? this.resultMessage,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tag': tag,
      'creationDate': creationDate,
      'userId': userId,
      'accessKey': accessKey,
      'preregistrationData': preregistrationData,
      'registrationData': registrationData,
      'cardId': cardId,
      'cardType': cardType,
      'cardRegistrationURL': cardRegistrationURL,
      'status': status,
      'resultCode': resultCode,
      'resultMessage': resultMessage,
      'currency': currency,
    };
  }

  factory CardRegistration.fromMap(Map<String, dynamic> map) {
    return CardRegistration(
      id: map['Id'],
      tag: map['Tag'],
      creationDate: double.parse(map['CreationDate'].toString()),
      userId: map['UserId'],
      accessKey: map['AccessKey'],
      preregistrationData: map['PreregistrationData'],
      registrationData: map['RegistrationData'],
      cardId: map['CardId'],
      cardType: map['CardType'],
      cardRegistrationURL: map['CardRegistrationURL'],
      status: map['Status'],
      resultCode: map['ResultCode'],
      resultMessage: map['ResultMessage'],
      currency: map['Currency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CardRegistration.fromJson(String source) =>
      CardRegistration.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CardRegistration(id: $id, tag: $tag, creationDate: $creationDate, userId: $userId, accessKey: $accessKey, preregistrationData: $preregistrationData, registrationData: $registrationData, cardId: $cardId, cardType: $cardType, cardRegistrationURL: $cardRegistrationURL, status: $status, resultCode: $resultCode, resultMessage: $resultMessage, currency: $currency)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CardRegistration &&
        o.id == id &&
        o.tag == tag &&
        o.creationDate == creationDate &&
        o.userId == userId &&
        o.accessKey == accessKey &&
        o.preregistrationData == preregistrationData &&
        o.registrationData == registrationData &&
        o.cardId == cardId &&
        o.cardType == cardType &&
        o.cardRegistrationURL == cardRegistrationURL &&
        o.status == status &&
        o.resultCode == resultCode &&
        o.resultMessage == resultMessage &&
        o.currency == currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        tag.hashCode ^
        creationDate.hashCode ^
        userId.hashCode ^
        accessKey.hashCode ^
        preregistrationData.hashCode ^
        registrationData.hashCode ^
        cardId.hashCode ^
        cardType.hashCode ^
        cardRegistrationURL.hashCode ^
        status.hashCode ^
        resultCode.hashCode ^
        resultMessage.hashCode ^
        currency.hashCode;
  }
}
