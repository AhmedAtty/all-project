import 'package:flutter/material.dart';

import '../constans.dart';
import '../helper.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.size,
    required this.name,
    required this.poster,
    required this.rate,
  }) : super(key: key);

  final Size size;
  final String name;
  final String poster;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: size.height * .3,
      width: size.width * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w600_and_h900_bestv2$poster"),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .1,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.7),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Center(
                        child: Text(
                          "$rate",
                          style: TextStyle(color: fontColor),
                        )),
                  ),
                  top: 0,
                  right: 0),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              cutFormBigTitle("$name"),
              style: const TextStyle(color: fontColor, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
