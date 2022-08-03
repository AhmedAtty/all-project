import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/generated/l10n.dart';
import 'package:smm_app/models/requests/order_request.dart';
import 'package:smm_app/providers/payment_provider.dart';
import 'package:smm_app/screens/home_screen.dart';
import 'package:smm_app/widgets/custom_elevated_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentProvider _paymentProvider;
  late OrderRequest orderRequest;

  @override
  void didChangeDependencies() {
    _paymentProvider = Provider.of<PaymentProvider>(context);
    orderRequest = ModalRoute.of(context)!.settings.arguments! as OrderRequest;
    log('Order request -> ${orderRequest.service.toJson()}');
    super.didChangeDependencies();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).payment),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              CreditCardWidget(
                  cardNumber: _paymentProvider.cardData.cardNumber,
                  expiryDate: _paymentProvider.cardData.expiryDate,
                  cardHolderName: _paymentProvider.cardData.cardHolderName,
                  cvvCode: _paymentProvider.cardData.cvvCode,
                  showBackView: false,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {}),
              CreditCardForm(
                formKey: formKey,
                onCreditCardModelChange: (CreditCardModel data) {
                  _paymentProvider.cardData = data;
                },
                themeColor: Theme.of(context).primaryColor,
                obscureCvv: true,
                obscureNumber: false,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardNumberDecoration: InputDecoration(
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  labelText: S.of(context).cardNumber,
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: InputDecoration(
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  labelText: S.of(context).expiryDate,
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  labelText: S.of(context).cvv,
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  labelText: S.of(context).cardHolder,
                  hintText: 'Card Holder',
                ),
                expiryDate: _paymentProvider.cardData.expiryDate,
                cardHolderName: _paymentProvider.cardData.cardHolderName,
                cvvCode: _paymentProvider.cardData.cvvCode,
                cardNumber: _paymentProvider.cardData.cardNumber,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                        (route) => false);
                  },
                  text: S.of(context).payNow),
            ],
          ),
        ),
      ),
    );
  }
}
