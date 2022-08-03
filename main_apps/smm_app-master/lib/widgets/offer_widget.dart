import 'package:flutter/material.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/screens/create_order_screen.dart';

class OfferWidget extends StatelessWidget {
  final Service offer;
  const OfferWidget({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreateOrderScreen(service: offer),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              offer.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
