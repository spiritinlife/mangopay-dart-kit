
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mangopay_card/exceptions/mango_exception.dart';
import 'package:mangopay_card/exceptions/mango_network_exception.dart';
import 'package:mangopay_card/mango_card.dart';
import 'package:mangopay_card/mango_settings.dart';
import 'package:mangopay_card/models/card_registration.dart';

class Api {
  static const _VERSION = 2.01;

  static Future<CardRegistration> registerCard({
    required String baseUrl,
    required String clientId,
    required String cardPreregistrationId,
    required String registrationData,
  }) async {
    final Uri url = Uri.parse(
        '$baseUrl/v$_VERSION/$clientId/CardRegistrations/$cardPreregistrationId');

    try {
      final Response cardRegisterResponse = await http.put(
        url,
        body: {'RegistrationData': registrationData, 'Id': clientId},
      );

      if (cardRegisterResponse.statusCode >= 400)
        throw MangoException('101699', "CardRegistration error");

      final CardRegistration cardRegistration =
          CardRegistration.fromJson(cardRegisterResponse.body);

      if (cardRegistration.resultCode != "000000")
        throw MangoException.cardRegistration(
          cardRegistration.resultCode,
          cardRegistration.resultMessage,
        );

      return cardRegistration;
    } on SocketException catch (e) {
      throw MangoNetworkException(e);
    } on HttpException catch (e) {
      throw MangoNetworkException(e);
    }
  }

  // https://docs.mangopay.com/endpoints/v2.01/cards#e1042_post-card-info
  static tokenRequest(MangoSettings settings, MangoCard card) async {
    // response data=gcpSOxwNHZutpFWmFCAYQu1kk25qPfJFdPaHT9kM3gKumDF3GeqSw8f-k8nh-s5OC3GNnhGoF
    try {
      final Response tokenResponse = await http.post(
        Uri.parse(settings.cardRegistrationURL),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'accessKeyRef': settings.accessKey,
          'data': settings.preregistrationData,
          'cardNumber': card.cardNumber,
          'cardExpirationDate': card.expirationDate,
          'cardCvx': card.cvx,
        },
      );

      if (tokenResponse.statusCode >= 400)
        throw MangoException.fromJson(tokenResponse.body);

      if (tokenResponse.body.isEmpty) throw MangoException.token('001599');

      if (tokenResponse.body.indexOf('errorCode=') == 0)
        throw MangoException.token(
          tokenResponse.body.replaceAll('errorCode=', ''),
        );

      return tokenResponse.body;
    } on SocketException catch (e) {
      throw MangoNetworkException(e);
    } on HttpException catch (e) {
      throw MangoNetworkException(e);
    }
  }
}
