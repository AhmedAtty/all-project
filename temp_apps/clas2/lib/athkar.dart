import 'package:flutter/material.dart';

class azkar extends StatefulWidget {
  const azkar({Key? key}) : super(key: key);

  @override
  _azkarState createState() => _azkarState();
}

class _azkarState extends State<azkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("ahmed"),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        primary: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("0"),
                ElevatedButton(onPressed: () {}, child: Text("ahmed")),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("ahmed"),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(30),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
