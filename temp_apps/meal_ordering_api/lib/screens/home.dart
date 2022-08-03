import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meal_ordering_api/models/article.dart';
import 'package:search_page/search_page.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:share_extend/share_extend.dart';

import '../services/api.dart';
import 'category.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Api api = Api();
  List list = [
    "business",
    "entertainment",
    "health",
    "science",
    "sports",
    "technology"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Otlbna",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Image.asset('assits/images/food_icon.jpg'),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (context, index, ri) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(children: [
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage('assits/images/food_icon.jpg'),
                              fit: BoxFit.fill)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        list[index],
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ]),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "business",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "entertainment",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "health",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "science",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "sports",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "business :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            gridWidget(
              api: api,
              cat: "technology",
            ),
          ],
        ),
      ),
    );
  }
}

class gridWidget extends StatelessWidget {
  const gridWidget({
    Key? key,
    required this.api,
    required this.cat,
  }) : super(key: key);

  final Api api;
  final String cat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: api.getNewsCategory(cat),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                           'https://i.stack.imgur.com/IzrpQ.png',
                        ),
                        fit: BoxFit.cover),
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
