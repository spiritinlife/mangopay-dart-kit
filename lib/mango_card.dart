import 'package:mangopay_card/validators/card_validator.dart';
import 'package:mangopay_card/validators/cvv_validator.dart';
import 'package:mangopay_card/validators/expiration_date_validator.dart';
import 'package:meta/meta.dart';

class MangoCard {
  final String cardNumber;
  final String expirationDate;
  final String cvx;
  final String cardType;

  MangoCard({
    @required this.cardNumber,
    @required this.expirationDate,
    @required this.cvx,
    @required this.cardType,
  });

  assertCardIsValid() =>
      CardValidator.validate(cardNumber) &&
      CvvValidator.validate(cvx, cardType) &&
      ExpirationDateValidator.validate(expirationDate, DateTime.now());

  @override
  String toString() {
    return 'MangoCard(cardNumber: $cardNumber, expirationDate: $expirationDate, cvx: $cvx, cardType: $cardType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MangoCard &&
        o.cardNumber == cardNumber &&
        o.expirationDate == expirationDate &&
        o.cvx == cvx &&
        o.cardType == cardType;
  }

  @override
  int get hashCode {
    return cardNumber.hashCode ^
        expirationDate.hashCode ^
        cvx.hashCode ^
        cardType.hashCode;
  }
}
