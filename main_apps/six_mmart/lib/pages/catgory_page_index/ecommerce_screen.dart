import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/ditels_screen/ditels_ecomerce/ditels_ecmorceall.dart';
import 'package:sex_smart/ditels_screen/ditels_screen/ditels_catgores.dart';
import 'package:sex_smart/pages/search_screen/search_screen.dart';
import 'package:sex_smart/provider/provider_catgory/provider_catgory.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/home_widget/home_cirsuler.dart';
import 'package:sex_smart/widget/rating_app/rating_app.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class EcommerceScreen extends StatelessWidget {
  TextEditingController conteroler = TextEditingController();

  List<String> imgmall = [
    'https://pioneers-solutions.com/uploads/online-store-features.webp',
    'https://techvillageeg.com/wp-content/uploads/2022/03/%D8%B3%D8%B9%D8%B1-%D8%AA%D8%B5%D9%85%D9%8A%D9%85-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A.png',
    'https://www.egy.malimalk.com/wp-content/uploads/2021/06/%D8%A7%D8%B3%D8%B9%D8%A7%D8%B1-%D8%A7%D9%84%D9%85%D9%88%D8%AA%D9%88%D8%B3%D9%8A%D9%83%D9%84%D8%A7%D8%AA-%D9%81%D9%8A-%D9%85%D8%B5%D8%B1-2021.jpg',
    'https://www.sendiancreations.com/ar/wp-content/uploads/2020/02/%D8%AE%D8%B7%D9%88%D8%A7%D8%AA-%D8%A5%D9%86%D8%B4%D8%A7%D8%A1-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A5%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A-%D8%A7%D8%AD%D8%AA%D8%B1%D8%A7%D9%81%D9%8A.jpg',
    'https://aait.sa/news/wp-content/uploads/2022/05/%D9%85%D8%AA%D8%AC%D8%B1-%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9.png',
    'https://serv5.com/wp-content/uploads/2020/04/%D8%B9%D8%B1%D8%B6-%D8%B3%D8%B9%D8%B1-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A2.jpg',
    'https://alriyadh-city.com/wp-content/uploads/2020/07/%D9%83%D9%8A%D9%81-%D8%A7%D9%81%D8%AA%D8%AD-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A.jpg'
  ];
  List<String> imgma2 = [
    'https://shop.mts.by/upload/resize_cache/webp/iblock/415/Noutbuk-Huawei-MateBook-D15-_misticheskiy-serebristyy_.webp',
    'https://montgatonline.com/wp-content/uploads/2021/06/mjmoaah-mn-5-boksrat-ktonyl-dyzyn-160352_510x@2x.progressive.jpg',
    'https://aait.sa/news/wp-content/uploads/2021/11/1-1-1.jpg',
    'https://www.sendiancreations.com/ar/wp-content/uploads/2020/02/%D8%AE%D8%B7%D9%88%D8%A7%D8%AA-%D8%A5%D9%86%D8%B4%D8%A7%D8%A1-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A5%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A-%D8%A7%D8%AD%D8%AA%D8%B1%D8%A7%D9%81%D9%8A.jpg',
    'https://www.elbalad.news/Upload/libfiles/876/4/387.png',
    'https://cdn.almowafir.com/1/%D8%B4%D9%86%D8%B7%D8%A9-%D9%84%D9%8A%D8%AF%D9%8A-%D8%AF%D9%8A%D9%88%D8%B1.jpg',
    'https://alriyadh-city.com/wp-content/uploads/2020/07/%D9%83%D9%8A%D9%81-%D8%A7%D9%81%D8%AA%D8%AD-%D9%85%D8%AA%D8%AC%D8%B1-%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    ProviderCatgory datacatgo = Provider.of<ProviderCatgory>(context)
      ..getCatgory();

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.apps_outlined))),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  navgiTo(context, const SearchScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 6,
                               child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,

                                ),
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7),
                                      child: Icon(Icons.search),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              WidgetCarousel(),
              //فئات
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'فئات',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: imgma2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navgiTo(context, DitelsCatgores(imgma2[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorManager.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffBCB6B6),
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: imgma2[index],
                                          fit: BoxFit.cover,
                                          height: 60,
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            child: Shimmer.fromColors(
                                              child: Image.asset('assets/loading.png',),
                                              baseColor: Colors.orange,
                                              highlightColor: Colors.amber[100]!,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  'assets/loading.png'),
                                        ),
                                        Container(
                                          height: 60,
                                          color: ColorManager.black
                                              .withOpacity(.2),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            datacatgo.list[index].name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 8,
                                                    color: ColorManager.black),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

//المتجر الشعبي
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'المتجر الشعبي',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 155,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imgmall.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 145,
                            width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorManager.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffBCB6B6),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: CachedNetworkImage(
                                        imageUrl: imgmall[index],
                                        fit: BoxFit.cover,
                                        height: 90,
                                        width: double.infinity,
                                        placeholder: (context, url) => SizedBox(
                                          child: Shimmer.fromColors(
                                            child: Image.asset('assets/loading.png',),
                                            baseColor: Colors.orange,
                                            highlightColor: Colors.amber[100]!,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/loading.png'),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text('OrderCity',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    Container(
                                      width: 140,
                                      child: Text(
                                          'OrderCity,Country,Road0022222',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    RattingApp()
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 13,
                                      child: Icon(
                                          Icons.favorite_outline_outlined)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

//مطعم شعبي قريب
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'مطعم شعبي قريب',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 105,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 22,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorManager.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffBCB6B6),
                                    offset: Offset(0.0, 2.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://media-cdn.tripadvisor.com/media/photo-s/19/88/da/73/caption.jpg',
                                    fit: BoxFit.cover,
                                    height: 90,
                                    width: 80,
                                    placeholder: (context, url) => SizedBox(
                                      child:
                                          Image.asset('assets/images/img.png'),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/images/heart.png'),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    RattingApp(),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text(r'$1000.00',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
//أفضل المتجر
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'أفضل المتجر',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
              ),

              SizedBox(
                height: 105,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imgmall.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffBCB6B6),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: CachedNetworkImage(
                                    imageUrl: imgmall[index],
                                    fit: BoxFit.cover,
                                    height: 90,
                                    width: 80,
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
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    RattingApp(),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: 77,
                                      child: Text(r'$1000.00',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 8,
                                              )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              //جميع المتجر
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'جميع المتجر',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 14),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: imgma2.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          navgiTo(context, DitelsEcomerce(imgma2[index]));
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*5/812),
                          child: Card(
                            color: ColorManager.white,
                            elevation: 5,
                            child: Row(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,

                                  child: CachedNetworkImage(
                                    imageUrl: imgma2[index],
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height*90/812,
                                    width: MediaQuery.of(context).size.height*90/812,
                                    placeholder: (context, url) => SizedBox(
                                      child:
                                      Shimmer.fromColors(
                                        child: Image.asset('assets/loading.png',),
                                        baseColor: Colors.orange,
                                        highlightColor: Colors.amber[100]!,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/images/heart.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.height*10/812,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*7/812,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*177/375,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 13,
                                              )),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*7/812,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*177/375,
                                      child: Text('foodDedddddddddddddlvry',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 13,
                                              )),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width*177/375,
                                      child: Text(r'$1000.00',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 13,
                                              )),
                                    ),
                                    RattingApp(),
                                    SizedBox(
                                      height: 7,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                    radius: 13,
                                    child: Icon(Icons.favorite_outline_outlined)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*7/375,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
