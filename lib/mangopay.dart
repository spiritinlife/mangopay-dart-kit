library mangopay_card;

import 'package:flutter/widgets.dart';
import 'package:mangopay_card/api.dart';
import 'package:mangopay_card/mango_card.dart';
import 'package:mangopay_card/mango_settings.dart';
import 'package:mangopay_card/models/card_registration.dart';

/// A Calculator.
class MangoPay {
  final MangoSettings mangoSettings;
  final MangoCard mangoCard;

  MangoPay({
    @required this.mangoSettings,
    @required this.mangoCard,
  });

  // @throws exceptions
  Future<CardRegistration> registerCard() async {
    
    // @throws ValidationException
    mangoCard.assertCardIsValid();

    // first tokenize card
    final String registrationData = await Api.tokenRequest(this.mangoSettings, this.mangoCard);

    // then register card with tokenized data
    return await Api.registerCard(
      baseUrl: mangoSettings.baseURL,
      clientId: mangoSettings.clientId,
      cardPreregistrationId: mangoSettings.cardPreregistrationId,
      registrationData: registrationData,
    );
  }
}
