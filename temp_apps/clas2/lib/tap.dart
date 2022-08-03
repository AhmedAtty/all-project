import 'package:clas2/athkar.dart';
import 'package:clas2/bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabBar.dart';

import 'main.dart';

class Tap extends StatefulWidget {
  const Tap({Key? key}) : super(key: key);

  @override
  _TapState createState() => _TapState();
}

class _TapState extends State<Tap> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سبحه",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          const Center(
            child: Text(
              "سبحه",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Help();
                  });
            },
            icon: const Icon(
              Icons.info,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        bottom: TabBar(
          indicator: PointTabIndicator(),
          controller: controller,
          tabs: const [
            Tab(text: "ahmed"),
            Tab(text: "text"),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const azkar(),
          MyHomePage(),
        ],
      ),
    );
  }
}
