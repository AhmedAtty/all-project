import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/ditels_screen/ditels_screen/ditels_catgores.dart';
import 'package:sex_smart/pages/search_screen/search_screen.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/home_widget/home_cirsuler.dart';
import 'package:sex_smart/widget/rating_app/rating_app.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GroceryDelvryScreen extends StatelessWidget {
  List<String> imag1 = [
    'https://www.annahar.com/ContentFilesArchive/517683Image1-1180x677_d.jpg?version=4169869',
    'https://static.webteb.net/images/content/tbl_articles_article_33438_3636fdcddca-989c-4124-85dc-43472920a7f0.jpg',
    'https://www.almrsal.com/wp-content/uploads/2017/03/%D9%84%D8%AD%D9%88%D9%85.jpg',
    'https://cairosales.com/45054-thickbox_default/black-decker-food-steamer-3-tiers-hs600.jpg',
    'https://s.alicdn.com/@sc04/kf/U69e6b4e3d5254f839b936de20b2a1a5aa.png_300x300.png'
        'https://cairosales.com/45054-thickbox_default/black-decker-food-steamer-3-tiers-hs600.jpg',
    'https://static1.shasha.ps/cachedImages/resize/740/494/shasha_images/sad-jpg-87795495664651172.jpg',
    'https://media.istockphoto.com/photos/family-shopping-picture-id966280284',
    'https://www.hiamag.com/sites/default/files/styles/1000xauto/public/article/23/06/2016/kitchen.jpg?itok=WLfOPecz',
    'https://s4.forcloudcdn.com/item/images/dmc/e52b02c9-9b45-4d23-b528-c893c3b783d0-750x681.jpeg_495x0.jpg'
  ];

  List<String> imag2 = [
    'https://www.albayan.ae/polopoly_fs/1.1946988.1475832292!/image/image.jpg',
    'https://cdn1-m.zahratalkhaleej.ae//wp-content/uploads/2016/03/avocado-sliced-in-half.jpg?v=6',
    'https://previews.123rf.com/images/lightvisionftb/lightvisionftb2001/lightvisionftb200100059/138603658-vector-juicy-fresh-orange-background-with-whole-and-slices-of-oranges-with-juice-splash-leaves-and-d.jpg',
  ];

  List<String> imag3 = [
    'https://cdn1-m.zahratalkhaleej.ae//wp-content/uploads/2016/03/avocado-sliced-in-half.jpg?v=6',
    "https://www.spinneys-egypt.com/storage/product/5505/VYxaAmfhSqfuTx1vLH5rO3ilK9toqMgO9M9rnzcL.jpg",
    "https://images.ctfassets.net/e8bhhtr91vp3/5BuvAsoOLrKAE1CcfVs834/e0b191f5574b8d9c9579f7cc44f54c42/6221155033611_lipton_yellow_label_black_tea_bags_75s_arabic-1643925-jpg.jpg.ulenscale.490x490.webp?w=800&q=80",
    "https://www.hiamag.com/sites/default/files/styles/1000xauto/public/article/11/10/2017/6062011-305584936.jpg?itok=6ljx_Du0",
    "https://jumla.io/file-apis/v1/image/d2fc8a61-a871-4a18-ba8c-f6fbae30ab7c.z_e1,1_w600.webp",
    "https://www.rinnoo.net/f/res/s06/products-photos/000/029/0002985-377-rinnoo-87c6b688c305416cbedb6a1a4f887482-r00.jpg",
    "https://cdnprod.mafretailproxy.com/sys-master-root/h04/h83/17545858285598/111111_main.jpg_480Wx480H",
    "https://baladna.com/wp-content/uploads/2019/08/Baladna_JUICE_Apple-_1.5L.png",
  ];

  List<String> imag4 = [
    'https://bestriyadh.com/wp-content/uploads/2021/11/images-19-4.jpeg',
    'https://media.gemini.media/img/large/2018/2/12/2018_2_12_12_17_1_66.jpg',
    'https://www.fekera.com/wp-content/uploads/2022/03/%D8%AA%D9%81%D8%B3%D9%8A%D8%B1-%D8%B1%D8%A4%D9%8A%D8%A9-%D8%A7%D9%84%D8%AE%D8%B6%D8%B1%D9%88%D8%A7%D8%AA-%D9%81%D9%8A-%D8%A7%D9%84%D9%85%D9%86%D8%A7%D9%85.jpg',
    "https://blogger.googleusercontent.com/img/a/AVvXsEj6N0IZ57KxEPFbLu1hpQcwHc9-f_yqtJaueUp5FKmioIqVH7bS8oTIl_OkQNQB2Ys2-6-GXS3-4Z-rb0idTh0rOQ0HmiqKG1dyvZK7sdtnWQNq9LZ0GwcXW7pdX2Uh7UZV7ZKBzXvcQLdKX1tIGnH2gLBMDoHTRuU-FRmUVgZIQv4uRUW_VBXBtbii=s16000",
    "https://hi-cdn.t-rp.co.uk/images/hotels/121090/9?width=870&height=480&crop=false",
    "https://www.stepvideograph.net/wp-content/uploads/2021/04/%D9%85%D8%B9%D8%A7%D9%8A%D9%86%D8%A9-%D9%8A%D9%88%D8%AA%D9%8A%D9%88%D8%A8-2-3-1024x576.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.apps_outlined)),
        actions: [
          Icon(Icons.location_pin),
          Icon(Icons.notification_important),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                navgiTo(context, SearchScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Card(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Icon(Icons.search),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            WidgetCarousel(),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: imag1.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navgiTo(context, DitelsCatgores(imag1[index]));
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
                                        imageUrl: imag1[index],
                                        fit: BoxFit.cover,
                                        height: 60,
                                        placeholder: (context, url) =>
                                            SizedBox(
                                              child: Image.asset(
                                                  'assets/images/heart.png'),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/images/heart.png'),
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
                                Container(
                                  width: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'datacatgo.list[index].name!',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                              fontSize: 11,
                                              color: ColorManager.black),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
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
            //حملة
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'حملة',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*.25,

              child: ListView.builder(
                clipBehavior: Clip.antiAlias,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: imag2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      navgiTo(context, DitelsCatgores(imag2[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Container(
                            width: 160,
                            height: MediaQuery.of(context).size.height*.25,
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
                            child: Image.network(
                              imag2[index],
                              fit: BoxFit.cover,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //افضل المنتجات
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'افضل منتجات',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                clipBehavior: Clip.antiAlias,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: imag3.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 210,
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
                          width: 170,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                    imag3[index],
                                    fit: BoxFit.cover,
                                    height: 120,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Foodsafffffffff',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    'eoring',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        r'$570.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        r'$570.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: ColorManager.erorr),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.erorr.withOpacity(.9),
                                    ),
                                    child: RattingApp()),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: ColorManager.gryn,
                                      size: 29,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //اافضل المتجر
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'افضل المتجر',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 14),
              ),
            ),

            SizedBox(
              height: 150,

              child: ListView.builder(
                itemCount: imag4.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 170,
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
                                  Image.network(
                                    imag4[index],
                                    fit: BoxFit.cover,
                                    height: 90,
                                    width: double.infinity,
                                  ),
                                  Text(
                                    'Foodsafffffffff',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    'eoring',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  RattingApp()
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                    radius: 13,
                                    child: Icon(Icons.favorite_outline_outlined)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //افضل المطعام
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'افضل المطعام',
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
                itemCount: imag1.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        Column(
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
                                      imag1[index],
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
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            r'$570.00',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            r'$570.00',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11,
                                                color: ColorManager.erorr),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 9,
                          right: 5,
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: ColorManager.gryn,
                                size: 29,
                              )
                            ],
                          ),
                        ),
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
            ListView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: imag4.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    navgiTo(context, DitelsCatgores(imag4[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
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
                      width: 230,
                      height: 220,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    imag4[index],
                                    fit: BoxFit.cover,
                                    height: 140,
                                    width: double.infinity,
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Foodsafffffffff',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    'eoring',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  RattingApp(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        r'$570.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        r'$570.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11,
                                            color: ColorManager.erorr),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 13,
                                    child: Icon(
                                        Icons.favorite_outline_outlined)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
