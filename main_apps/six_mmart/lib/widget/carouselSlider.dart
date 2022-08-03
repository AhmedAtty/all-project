import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


final List<String> imageList = [
  "assets/products/1.png",
  "assets/products/2.png",
  "assets/products/3.png",
  "assets/products/4.png",
  "assets/products/5.png",
  "assets/products/6.png",
  "assets/products/7.png",
];

Widget imageCarouselSlider = Container(
  child: CarouselSlider(
    options: CarouselOptions(
      enlargeCenterPage: true,
      enableInfiniteScroll: false,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(milliseconds: 1000),

    ),
    //معلومات الليست تبع الصور
    items: imageList
        .map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    e,
                    width: 800,
                    height: 80,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ))
        .toList(),
  ),
);
