import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/ditels_screen/ditels_ecomerce/ditels_ecmorceall.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/rating_app/rating_app.dart';

class DitelsCatgores extends StatelessWidget {
 String image;
 DitelsCatgores(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.apps_outlined)),
        actions: [
          IconButton(onPressed:
              (){},
              icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed:
              (){},
              icon: Icon(Icons.search)),
        ],
      ),
      body: InkWell(
        onTap: (){
          navgiTo(context, DitelsEcomerce(image));
        },
        child: Container(
          height: 85,
          child: Card(
            color: ColorManager.white,
            elevation: 3,
            shadowColor: ColorManager.gryn,
            child: Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,height: 60,
                          placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/heart.png'),),
                          errorWidget: (context, url, error) => Image.asset('assets/images/heart.png'),
                        ),
                      ),

                      SizedBox(width: 5,),
                      Container(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('fodassadsadsffsrrrrrrrrrrrrrrrrrrrrrrrrrrrraf',overflow: TextOverflow.ellipsis,
                            maxLines: 1,),
                            Text('fodassadsadsffsrrrrrrrrrrrrrrrrrrrrrrrrrrrraf',overflow: TextOverflow.ellipsis,
                            maxLines: 1,),
                            RattingApp(),
                            Text(r'$50.00',overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                          ],
                        ),
                      )


                    ],
                  ),
                 Column(
                   children: [
                     SizedBox(height: 5,),




                     Icon(Icons.add_circle,color: ColorManager.gryn,size: 29,),
                     SizedBox(height: 11,),
                     CircleAvatar(
                         radius: 13,
                         child: Icon(Icons.favorite_outline_outlined)),
                   ],
                 )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
