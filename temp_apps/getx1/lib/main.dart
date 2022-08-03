import 'package:flutter/material.dart';
import 'package:getx1/conttroller.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final HController controller = Get.put(HController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: controller.add, icon: Icon(Icons.add)),
                Text("${controller.conter.value}"),
                IconButton(
                    onPressed: controller.remove, icon: Icon(Icons.remove)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
