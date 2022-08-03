import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RattingApp extends StatelessWidget {
  const RattingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 13,
          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,

            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(width: MediaQuery.of(context).size.width*7/375,),
        Text('(3)',style: TextStyle(fontSize: 8),)
      ],
    );
  }
}
