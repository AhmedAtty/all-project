import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime/view_model/real_time_provider.dart';
import 'package:realtime/widgets/textf.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RealTimeProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: const RealTime())));
}

class RealTime extends StatelessWidget {
  const RealTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<RealTimeProvider>(context);
    return Scaffold(
      body: Container(
        child: Form(
          key: provider.formstate,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                SizedBox(
                  height: 700,
                  child: ListView.builder(
                    itemCount: provider.massedgsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.amberAccent,
                          child: Center(
                            child: Text(provider.massedgsList[index].massegeText),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                buildTextF(
                  icon: Icons.mail,
                  con1: provider.title,
                  hText: "insert Message",
                  text: "Message",
                  type: TextInputType.text,
                  vald: (val) {},
                  color: primColor,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formdata = provider.formstate.currentState;
                    if (formdata!.validate()) {
                      formdata.save();
                      provider.createDb(provider.title.text);
                      provider.getDb();
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
