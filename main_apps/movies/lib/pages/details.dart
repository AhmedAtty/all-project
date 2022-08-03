import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constans.dart';

class Details extends StatefulWidget {
  Details(
      {Key? key,
      required this.id,
      required this.title,
      required this.poster,
      required this.overView})
      : super(key: key);
  final String id;
  final String title;
  final String poster;
  final String overView;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=${widget.id}")!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          isLive: false,
          mute: false,
          loop: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    youtubePlayerController!.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Movies",
            style: TextStyle(color: Colors.white),
          )),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.poster}"),
                  fit: BoxFit.cover),),
          ),
          BackdropFilter(
              child: Container(
                color: Colors.black.withOpacity(.5),
              ),
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .025,
                ),
                Container(
                  height: size.height * .29,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("watch trailer",
                            style: TextStyle(color: fontColor, fontSize: 18)),
                      ),
                      SizedBox(
                        width: size.width * .85,
                        child: YoutubePlayer(
                            controller: youtubePlayerController!,
                            onReady: () {
                              youtubePlayerController!.play();
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(widget.title,
                      style: TextStyle(color: fontColor, fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(widget.overView,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: fontColor, fontSize: 18)),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launch('https://tire.egybest.bid/explore/?q=${widget.title}');
        },
        backgroundColor: primaryColor,
        label: Text("Search Egybest"),
      ),
    );
  }
}
