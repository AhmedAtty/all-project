import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sex_smart/provider/provider_home/provider_home.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class WidgetCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, homemodel, Widget? child) {
        return homemodel.list.length == 0
            ? SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: 5,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    initialPage: 1,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Shimmer.fromColors(
                      baseColor: Colors.amber[100]!,
                      highlightColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber,
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height * .23,
                child: CarouselSlider.builder(
                  itemCount: homemodel.list.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    clipBehavior: Clip.antiAlias,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: CachedNetworkImage(
                            imageUrl: homemodel.list[index].logo!,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            placeholder: (context, url) => SizedBox(
                                child: Shimmer.fromColors(
                                  child: Image.asset(
                                    'assets/loading.png',
                                  ),
                                  baseColor:Colors.orange,
                                  highlightColor: Colors.amber[100]!,
                                )),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/anmite.png'),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(.1)),
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}
