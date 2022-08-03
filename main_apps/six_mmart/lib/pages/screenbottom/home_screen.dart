import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../component/components.dart';
import '../../provider/provider_home/provider_home.dart';
import '../../widget/home_widget/home_cirsuler.dart';
import '../../widget/widget_home.dart';
import '../catgory_page_index/booking_screen.dart';
import '../catgory_page_index/ecommerce_screen.dart';
import '../catgory_page_index/food_delivry_screen.dart';
import '../catgory_page_index/grocry_screen.dart';
import '../catgory_page_index/parcel_delv_screen.dart';
import '../catgory_page_index/pharmacy_screen.dart';
import '../catgory_page_index/services_screen.dart';
import '../catgory_page_index/texi_boken_screen.dart';

class HomeScreen extends StatelessWidget {
  List<Widget> mypage = [
    EcommerceScreen(),
    FoodDelvryScreen(),
    GroceryDelvryScreen(),
    PharmacyDelvryScreen(),
    BookenScreen(),
    ServcesDelvryScreen(),
    ParcelDelvryScreen(),
    TaxiDelvryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        //  navgiTo(context, SearchScreen());
                      },
                      icon: Icon(Icons.search)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .005,
          ),
          WidgetCarousel(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .005,
          ),
          Consumer<HomeViewModel>(
            builder: (BuildContext context, homecatgory, Widget? child) {
              return SizedBox(
                  child: homecatgory.list.length == 0
                      ? GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 9,
                                  crossAxisSpacing: 9,
                                  childAspectRatio: .7),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * .015,
                            ),
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .14,

                                    child: Shimmer.fromColors(
                                      baseColor: Colors.amber[100]!,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *.03,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.amber[100]!,
                                      highlightColor: Colors.white,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * .015,
                          ),
                          child: GridView.builder(
                              itemCount: homecatgory.list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 9,
                                      crossAxisSpacing: 9,
                                      childAspectRatio: .9),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      navgiTo(context, mypage[index]);
                                    },
                                    child: WidgetHome(homecatgory.list[index]));
                              }),
                        ));
            },
          ),
        ],
      ),
    ));
  }
}
