import 'package:flutter/material.dart';
import 'package:person/models/post_model.dart';
import 'package:person/view_model/home_prov.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key? key, @required this.name}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProv>(context);
    // if(i != 0){
    //   if(provider.postList[i-1].userId > provider.postList[i].userId){
    //     // Post temp ;
    //     // temp= provider.postList[i-1];
    //     // provider.postList[i]=temp;
    //     // provider.postList[i-1] = provider.postList[i];
    //   }
    // }
    int onetotal = 0;
    int twototal = 0;
    int threetotal = 0;
    int fourtotal = 0;
    int fivetotal = 0;
    int sixtotal = 0;
    int sivintotal = 0;
    int eghttotal = 0;
    int ninetotal = 0;
    int tentotal = 0;

    for (int i = 0; i < provider.postList.length; i++) {
      if (provider.postList[i].userId == 1) {
        onetotal++;
      }
      if (provider.postList[i].userId == 2) {
        twototal++;
      }
      if (provider.postList[i].userId == 3) {
        threetotal++;
      }
      if (provider.postList[i].userId == 4) {
        fourtotal++;
      }
      if (provider.postList[i].userId == 5) {
        fivetotal++;
      }
      if (provider.postList[i].userId == 6) {
        sixtotal++;
      }
      if (provider.postList[i].userId == 7) {
        sivintotal++;
      }
      if (provider.postList[i].userId == 8) {
        eghttotal++;
      }
      if (provider.postList[i].userId == 9) {
        ninetotal++;
      }
      if (provider.postList[i].userId == 10) {
        tentotal++;
      }
    }
    return Scaffold(
        appBar: AppBar(title: Text(name!), centerTitle: true),
        body: ListView.builder(
          itemCount: provider.postList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.cyan),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            child: Text(
                              provider.postList[index].title,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            height: 50,
                            child: Text(
                              provider.postList[index].body.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                child: Text(
                                  provider.postList[index].userId.toString(),
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 70,
                                child: Text(
                                 'dobeld',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 10,
                                child: Text(
                                  provider.postList[index].userId == 1
                                      ? onetotal.toString() : provider
                                      .postList[index].userId == 2
                                      ? twototal.toString() : provider
                                      .postList[index].userId == 3
                                      ? threetotal.toString() : provider
                                      .postList[index].userId == 4
                                      ? fourtotal.toString() : provider
                                      .postList[index].userId == 5
                                      ? fivetotal.toString() : provider
                                      .postList[index].userId == 6
                                      ? sixtotal.toString() : provider
                                      .postList[index].userId == 7
                                      ? sivintotal.toString() : provider
                                      .postList[index].userId == 8
                                      ? eghttotal.toString() : provider
                                      .postList[index].userId == 9
                                      ? ninetotal.toString():tentotal.toString(),
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
