
import 'package:flutter/material.dart';
class MyHome extends StatelessWidget {
   MyHome({Key? key}) : super(key: key);
  int i  = 13  ;
  double x (int i){
    if(i%4==0){
      var e=i/4;
      print(e);
      return e * 100;
    }else{
      double e = i.toDouble();
      while(e%4!=0){
        e++;
        print(e);
        if(e%4==0){
          return e /4 *100;
        }
      }

      return 100;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width:  double.infinity,
          child: SingleChildScrollView(
            child: Column(
            children: [
              Text('data'),
              SizedBox(
                height: x(i),
                child: GridView.builder(
                  itemCount: i,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5
                ), itemBuilder: (context,index){
                  return Container(
                    color: Colors.yellow,

                  );
                }),
              ),
              Text('data'),
              SizedBox(
                height: x(5),
                child: GridView.builder(
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                    ), itemBuilder: (context,index){
                  return Container(
                    color: Colors.yellow,

                  );
                }),
              ),
              Text('data'),
              SizedBox(
                height: x(9),
                child: GridView.builder(
                    itemCount: 9,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                    ), itemBuilder: (context,index){
                  return Container(
                    color: Colors.yellow,

                  );
                }),
              ),
              Text('data'),
              SizedBox(
                height: x(15),
                child: GridView.builder(
                    itemCount: 15,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                    ), itemBuilder: (context,index){
                  return Container(
                    color: Colors.yellow,

                  );
                }),
              ),
             


            ],
        ),
          ),
      ),
    );
  }
}
