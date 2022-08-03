import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class PaymentProvider with ChangeNotifier {
  CreditCardModel _cardData = CreditCardModel('', '', '', '', false);

  CreditCardModel get cardData => _cardData;

  set cardData(CreditCardModel value) {
    _cardData = value;
    notifyListeners();
  }
}
