import 'package:flutter/material.dart';

import '../constans.dart';
import '../helper.dart';

class top10Widget extends StatelessWidget {
  const top10Widget({
    Key? key,
    required this.size,
    required this.title,
    required this.img,
    required this.rate,
  }) : super(key: key);

  final Size size;
  final String title;
  final String img;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * .3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2${img}"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(size.width / 40),
            height: size.height * .07,
            width: size.width * .4,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.7),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(35)),
            ),
            child: Center(
              child: Text(
                cutFormBigTitle(title),
                style:  TextStyle(
                  color: fontColor,
                  fontSize: size.width*12/size.width,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          bottom: 0,
          left: 0,
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(size.width / 40),
            height: size.height * .07,
            width: size.width * .2,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(.7),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                rate.toString(),
                style: const TextStyle(
                  color: fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          top: 0,
          right: 0,
        ),
      ],
    );
  }
}
