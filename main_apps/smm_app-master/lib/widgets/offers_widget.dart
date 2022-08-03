import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smm_app/models/service.dart';
import 'package:smm_app/widgets/offer_widget.dart';

class OffersWidget extends StatelessWidget {
  final List<Service> offers;
  const OffersWidget({Key? key, required this.offers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          enableInfiniteScroll: false,
        ),
        items: offers
            .map((e) => OfferWidget(
                  offer: e,
                ))
            .toList(),
      ),
    );
  }
}
