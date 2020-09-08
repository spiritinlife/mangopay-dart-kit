# mangopay_card

A dart port of https://github.com/Mangopay/cardregistration-js-kit/

# Use

```
Map dt = {...settings retrieved from your server...}

final mangoSettings = MangoSettings.fromMap({
    "baseURL": "https://api.sandbox.mangopay.com",
    "clientId": "vendora",
    "cardPreregistrationId": dt['card_preregistration_id'],
    "accessKey": dt['access_key'],
    "preregistrationData": dt['preregistration_data'],
    "cardRegistrationURL": dt['card_registration_url'],
});

final mangoCard = MangoCard.fromMap({
    "cardNumber": "4970049",
    "cvx": "12",
    "expirationDate": "0920",
});

final MangoPay mp = MangoPay(
    mangoSettings: mangoSettings,
    mangoCard: mangoCard,
);

try {
    CardRegistration cr = await mp.registerCard();
} on ApiErrorException {

} on ValidationException {
    
}
```
    


# TODO
- [] http errors
- [] >=400 mangoo errors