import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: provider(),
  ));
}

class provider extends StatelessWidget {
  provider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<Model>(
          builder: (context, model11, child) => Column(
            children: [
              Text(model11.text),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    model11.otherName();
                  },
                  child: Text("Do something"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String text = "welcome";

  otherName() {
    text = "ahmed";
    notifyListeners();
  }
}
