import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/model/model_home.dart';
import 'package:sex_smart/provider/bottom_pro/bottom_prov.dart';
import 'package:sex_smart/recources/color_managr.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WidgetHome extends StatelessWidget {
  CatgoryHome dataCatory;

  WidgetHome(this.dataCatory);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: MediaQuery.of(context).size.height *.12,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.circular(14),
          color: ColorManager.white,
        ),
        child:
        CachedNetworkImage(
          imageUrl: dataCatory.logo.toString(),
          fit: BoxFit.fill,
          placeholder: (context, url) => SizedBox(
              child: Shimmer.fromColors(
            child: Image.asset('assets/loading.png',),
            baseColor: Colors.orange,
            highlightColor: Colors.amber[100]!,
          ),
          ),
          errorWidget: (context, url, error) =>
              Image.asset('assets/anmite.gif'),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataCatory.name!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize:  12 ,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    ]);
  }
}
