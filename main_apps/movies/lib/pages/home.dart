import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/constans.dart';
import 'package:movies/helper.dart';
import 'package:movies/providers/home_provider.dart';
import 'package:movies/widgets/best_movis_widget.dart';
import 'package:movies/widgets/top10Widget.dart';
import 'package:provider/provider.dart';

import 'details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Movies",
                style: TextStyle(color: Colors.white),
              )),
          preferredSize: Size(size.width, size.height * .08)),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Top 10",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 18 / size.width),
                  ),
                ],
              ),
              SizedBox(
                  height: size.height * .3,
                  child: provider.movieList.isNotEmpty
                      ? CarouselSlider.builder(
                          itemCount: provider.movieList.length,
                          itemBuilder: (context, index, realIndex) {
                            return InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Loding"),
                                            CircularProgressIndicator(),
                                          ],
                                        ),
                                      );
                                    },
                                    barrierDismissible: false);
                                provider
                                    .getWatchKey(provider.movieList[index].id)
                                    .then((value) {
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Details(
                                   id: value,
                                   overView: provider.movieList[index].overview,
                                   poster: provider.movieList[index].poster_path,
                                   title: provider.movieList[index].title,
                                 ),));
                                });
                              },
                              child: top10Widget(
                                size: size,
                                img: provider.movieList[index].poster_path,
                                rate: provider.movieList[index].vote_average,
                                title: provider.movieList[index].title,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayAnimationDuration: Duration(seconds: 6),
                            enableInfiniteScroll: false,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Best Movies",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 20 / size.width),
                ),
              ),
              SizedBox(
                  height: size.height * .3,
                  child: provider.movieList2.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.movieList2.length,
                          itemBuilder: (context, index) {
                            return NewWidget(
                              size: size,
                              rate: provider.movieList2[index].vote_average,
                              name: provider.movieList2[index].title,
                              poster: provider.movieList2[index].poster_path,
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
              SizedBox(
                  height: size.height * .3,
                  child: provider.movieList3.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.movieList3.length,
                          itemBuilder: (context, index) {
                            return NewWidget(
                              size: size,
                              rate: provider.movieList3[index].vote_average,
                              name: provider.movieList3[index].title,
                              poster: provider.movieList3[index].poster_path,
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
