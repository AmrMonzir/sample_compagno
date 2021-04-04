import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_compagno/data/model/product.dart';
import 'package:sample_compagno/global_widgets/category_widget.dart';
import 'package:sample_compagno/global_widgets/custom_bottom_bar.dart';
import 'package:sample_compagno/global_widgets/search_widget.dart';
import 'package:sample_compagno/global_widgets/shimmer_container.dart';
import 'package:sample_compagno/global_widgets/top_gradient.dart';
import 'package:sample_compagno/modules/home/widgets/categories_placeholder.dart';
import 'package:sample_compagno/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      body: Column(
        children: [
          Container(
            height: 180.h,
            child: Stack(
              children: [
                TopGradient(),
                Positioned(
                  child: Image.asset("assets/images/logo.png",
                      width: 173.w, height: 33.h),
                  top: 49.h,
                ),
                Positioned(
                  child: SearchWidget(
                    onSubmitted: (value) {},
                  ),
                  bottom: 14.h,
                  left: 21.w,
                ),
                Positioned(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.shopping_cart,
                        color: Color(0xff4A4B4D), size: 20.w),
                    onPressed: () {
                      //TODO go to cart
                    },
                  ),
                  right: 10.w,
                  top: 45.h,
                )
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Obx(
                  () {
                    return controller.products.length > 0
                        ? CarouselSlider.builder(
                            carouselController: controller.carouselController,
                            itemCount: controller.products.length,
                            itemBuilder: (context, index, realIdx) {
                              return Obx(() {
                                if (controller.products[index] != null) {
                                  Product product = controller.products[index]!;
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(28),
                                    child: Container(
                                      width: 357.w,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            product.baseImage.largeImageUrl,
                                        fit: BoxFit.fitWidth,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          child: ShimmerContainer(
                                              height: 150.h,
                                              width: 357.w,
                                              borderRadius: 28),
                                          baseColor: kBaseShimmerColor,
                                          highlightColor:
                                              kHighlightShimmerColor,
                                        ),
                                      ),
                                    ),
                                  );
                                } else
                                  return Shimmer.fromColors(
                                    child: ShimmerContainer(
                                        width: 357.w, height: 150.h),
                                    baseColor: kBaseShimmerColor,
                                    highlightColor: kHighlightShimmerColor,
                                  );
                              });
                            },
                            options: CarouselOptions(
                              height: 150.h,
                              autoPlay: true,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                controller.currentDeal.value = index;
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(32, 5, 32, 0),
                            child: Shimmer.fromColors(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(28),
                                  child: ShimmerContainer(
                                      width: double.infinity, height: 150.h)),
                              baseColor: kBaseShimmerColor,
                              highlightColor: kHighlightShimmerColor,
                            ),
                          );
                  },
                ),
              ),
              Obx(
                () => Positioned(
                  bottom: 0.h,
                  left: 140.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.products.map((url) {
                      int index = controller.products.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentDeal.value == index
                              ? Color(0xffCD242E)
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 35.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 21.2.w),
                    SvgPicture.asset("assets/images/delivery.svg"),
                    SizedBox(width: 5.2.w),
                    Text(
                      "What would you like to order?",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Obx(() => controller.products.length > 0
                    ? Container(
                        height: 150.h,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              Product product = controller.products[index]!;
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(4, 11, 4, 0),
                                child: CategoryWidget(
                                    name: product.name,
                                    imgUrl: product.baseImage.smallImageUrl),
                              );
                            }),
                      )
                    : CategoriesPlaceholder()),
                SizedBox(height: 24.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 23.w),
                        SvgPicture.asset("assets/images/location.svg"),
                        SizedBox(width: 3.6.w),
                        Text(
                          "Nearest to you",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Text(
                        "View all",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
