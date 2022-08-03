import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/component/components.dart';
import 'package:sex_smart/ditels_screen/ditels_ecomerce/ditels_ecmorceall.dart';
import 'package:sex_smart/ditels_screen/ditels_screen/ditels_catgores.dart';
import 'package:sex_smart/pages/search_screen/search_screen.dart';
import 'package:sex_smart/recources/color_managr.dart';
import 'package:sex_smart/widget/home_widget/home_cirsuler.dart';
import 'package:sex_smart/widget/rating_app/rating_app.dart';

class PharmacyDelvryScreen extends StatelessWidget {
  List <String> imgmall=[
    "https://media.gemini.media/img/large/2016/11/27/2016_11_27_13_41_54_741.jpg",
    "https://mafahem.com/uploads/article_thumb/d_lg/2020/9/%D8%A3%D8%AF%D9%88%D9%8A%D8%A9-%D9%8A%D8%AC%D8%A8-%D8%A3%D9%86-%D8%AA%D8%AA%D9%88%D8%A7%D9%81%D8%B1-%D9%81%D9%8A-%D9%85%D9%86%D8%B2%D9%84%D9%83.webp",
    "https://media.gemini.media/img/large/2021/5/26/2021_5_26_13_2_48_270.jpg",
    "https://static.webteb.net/images/content/tbl_articles_article_30355_89650401371-03ce-43d8-805a-bf1facc59f4a.jpg",
    "https://4medicalis.com/wp-content/uploads/2020/02/68d41719fa31cef26a2eb63231bd9854.jpg",
    "https://kms.sohati.com/Images/998x749xo/article_2_115.jpg",
    "https://w7.pngwing.com/pngs/875/947/png-transparent-cartoon-tooth-brushing-illustration-hand-painted-toothbrush-watercolor-painting-white-painted.png",


  ];

  List <String> imgma2=[
    "https://1.bp.blogspot.com/-L1ayiBp1wzY/Xkh3Lgv1zvI/AAAAAAAAA8c/KKW2mkY1UTIbf4_aVhMFkKCvP2fjLzgqACLcBGAsYHQ/s1600/logo-dental-clinic.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5MBTbrFcaH1fvMVzwvYqgSjD_ojtamqo8Xw&usqp=CAU",
    "https://maarof.com/wp-content/uploads/2020/09/%D8%A7%D8%B3%D8%AA%D9%8A%D8%B1%D8%A7%D8%AF-%D9%85%D8%B3%D8%AA%D9%84%D8%B2%D9%85%D8%A7%D8%AA-%D8%B7%D8%A8%D9%8A%D8%A9-%D9%85%D9%86-%D8%AA%D8%B1%D9%83%D9%8A%D8%A7.jpg",
    "https://pbs.twimg.com/profile_images/470339383384489984/UrQS9cCC_400x400.jpeg",
    "https://alwafd.news/images/thumbs/828/news/c79c23bde58de8117bcbfce71fc3a60d.png",
    "https://www.aljoumhouria.com/index.php/glide/News/divers/medicament-medicine-pills.jpg",
    "https://alferdousco.com/wp-content/uploads/2021/07/government-or-private-hospital-Iran-1.jpg",
    "https://www.clevelandclinicabudhabi.ae/PublishingImages/rollups/mobile/CCAD_pic_aboutpatientexp_highlight_mobile.jpg",
  ];
  List <String> imgma3=[
    "https://www.e7kky.com/uploads/article/internal/images/%D8%A3%D9%81%D8%B6%D9%84-%D9%83%D8%B1%D9%8A%D9%85%D8%A7%D8%AA-%D9%84%D9%84%D8%A8%D8%B4%D8%B1%D8%A9-%D9%84%D9%84%D8%B9%D9%86%D8%A7%D9%8A%D8%A9-%D8%A8%D9%87%D8%A7-%D9%8A%D9%88%D9%85%D9%8A%D8%A7.jpeg",
    "https://a.nooncdn.com/cms/pages/20200129/ca744d20fbb0c3c15650c7565e84ea19/N21766511A-1.jpg",
    "https://yalladealnow.com/content/images/thumbs/5ff1acb3bf740e48f8e08693_daktacort-cream-15-gm.jpeg",
    "https://www.masralyoum.net/content/uploads/2021/08/12/40601bcbc2.jpg",
    "https://www.muhtwa.com/wp-content/uploads/%D8%A7%D8%B6%D8%B1%D8%A7%D8%B1-%D8%A8%D8%B1%D8%B4%D8%A7%D9%85-%D8%AA%D8%A7%D9%85%D9%88%D9%844.jpg",
    "https://m.msry3net.com/wp-content/uploads/2021/07/%D9%85%D8%A7-%D9%87%D9%88-%D8%A7%D9%84%D8%AA%D8%B1%D8%A7%D9%85%D8%A7%D8%AF%D9%88%D9%84-%D9%88%D9%85%D8%A7-%D8%A3%D8%B6%D8%B1%D8%A7%D8%B1%D9%87-1.jpg",
    "https://img.youm7.com/ArticleImgs/2021/6/11/33787-bda11e2d-9f7e-4ba5-98ff-c2c73a0dc040.jpg",
    "https://cdn.mosoah.com/wp-content/uploads/2018/06/23030648/%D8%AD%D8%A8%D9%88%D8%A8-%D8%A7%D9%88%D9%85%D9%8A%D8%BA%D8%A7-3-%D9%84%D9%84%D8%AA%D9%86%D8%AD%D9%8A%D9%812.jpg"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.apps_outlined))
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
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
                              height:50,
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
              SizedBox(height: 4,),
              WidgetCarousel(),
              //فئات
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('فئات',style: Theme.of(context).textTheme.bodyLarge,),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imgmall.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navgiTo(context, DitelsCatgores(imgmall[index]));
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
                                          imageUrl: imgmall[index],
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

//المتجر الشعبي
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('المتجر الشعبي',style: Theme.of(context).textTheme.bodyLarge!.
                copyWith(
                    fontSize: 14
                ),),
              ),
              SizedBox(

                height: 165,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imgma2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 145,
                            width: 190,
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
                                      imageUrl: imgma2[index],
                                      fit: BoxFit.cover,height: 90,width: double.infinity,
                                      placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/heart.jpg'),),
                                      errorWidget: (context, url, error) => Image.asset('assets/anmite.gif'),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: Text('OrderCity',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
                                          fontSize: 8,

                                        )),
                                  ),
                                  Container(
                                    width: 140,
                                    child: Text('OrderCity,Country,Road0022222',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
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
                                    child: Icon(Icons.favorite_outline_outlined)),
                              )
                            ],
                          ),
                          )
                        ],
                      ),
                    );
                  },),
              ),

//مطعم شعبي قريب
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('مطعم شعبي قريب',style: Theme.of(context).textTheme.bodyLarge!.
                copyWith(
                    fontSize: 14
                ),),
              ),
              SizedBox(

                height: 105,

                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: imgma3.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            )
                            ,child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(

                                  imageUrl: imgma3[index],
                                  fit: BoxFit.cover,height: 90,width: 80,
                                  placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/img.png'),),
                                  errorWidget: (context, url, error) => Image.asset('assets/images/anmite.gif'),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text('foodDedddddddddddddlvry',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
                                          fontSize: 8,

                                        )),
                                  ),
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text('foodDedddddddddddddlvry',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
                                          fontSize: 8,

                                        )),
                                  ),
                                  SizedBox(height: 7,),
                                  RattingApp(),
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text(r'$1000.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
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
                  },),
              ),
//أفضل المتجر
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('أفضل المتجر',style: Theme.of(context).textTheme.bodyLarge!.
                copyWith(
                    fontSize: 14
                ),),
              ),
              SizedBox(

                height: 105,

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
                            )
                            ,child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(

                                  imageUrl: imgmall[index],
                                  fit: BoxFit.cover,height: 90,width: 80,
                                  placeholder: (context, url) => SizedBox(child: Image.asset('assets/images/img.png'),),
                                  errorWidget: (context, url, error) => Image.asset('assets/images/anmite.gif'),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text('foodDedddddddddddddlvry',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
                                          fontSize: 8,

                                        )),
                                  ),
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text('foodDedddddddddddddlvry',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
                                          fontSize: 8,

                                        )),
                                  ),
                                  SizedBox(height: 7,),
                                  RattingApp(),
                                  SizedBox(height: 7,),
                                  Container(
                                    width: 77,
                                    child: Text(r'$1000.00',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:Theme.of(context).textTheme.bodyLarge!.
                                        copyWith(
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
                  },),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('جميع المتجر',style: Theme.of(context).textTheme.bodyLarge!.
                copyWith(
                    fontSize: 14
                ),),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
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
                        child: Card(
                          color: ColorManager.white,
                          elevation: 3,
                          child: Row(
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: CachedNetworkImage(
                                  imageUrl: imgma2[index],
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                  placeholder: (context, url) => SizedBox(
                                    child:
                                    Image.asset('assets/images/heart.png'),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset('assets/images/heart.png'),
                                ),
                              ),
                              SizedBox(
                                width: 11,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    width: 177,
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
                                    width: 177,
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
                                    width: 177,
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
                                width: 11,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),



            ],
          ),
        )
    );
  }
}
