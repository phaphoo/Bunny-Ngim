import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/slider_product_widget.dart';
import 'package:bunny_ngim_app/view/shimmers/flash_deal_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FlashDealsListWidget extends StatelessWidget {
  final bool isHomeScreen;
  const FlashDealsListWidget({super.key, this.isHomeScreen = true});

  @override
  Widget build(BuildContext context) {
    return isHomeScreen
        ? GetBuilder<ProductController>(
          builder: (flashDealController) {
            return flashDealController.productList != null
                ? flashDealController.productList!.isNotEmpty
                    ? SizedBox(
                      height:
                          ResponsiveHelper.isTab()
                              ? MediaQuery.of(context).size.width * .58
                              : 330,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          viewportFraction: ResponsiveHelper.isTab() ? .5 : .65,
                          autoPlay: true,
                          pauseAutoPlayOnTouch: true,
                          pauseAutoPlayOnManualNavigate: true,
                          enlargeFactor: 0.2,
                          enlargeCenterPage: true,
                          pauseAutoPlayInFiniteScroll: true,
                          disableCenter: true,
                          onPageChanged:
                              (index, reason) => flashDealController
                                  .setCurrentIndex(index, true),
                        ),
                        itemCount:
                            flashDealController.productList!.isEmpty
                                ? 1
                                : flashDealController.productList!.length,
                        itemBuilder: (context, index, next) {
                          return SliderProductWidget(
                            product: flashDealController.productList![index],
                            isCurrentIndex:
                                index == flashDealController.currentIndex,
                          );
                        },
                      ),
                    )
                    : const SizedBox()
                : const FlashDealShimmer();
          },
        )
        : GetBuilder<ProductController>(
          builder: (flashDealController) {
            return flashDealController.productList!.isNotEmpty
                ? RepaintBoundary(
                  child: MasonryGridView.count(
                    itemCount: flashDealController.productList!.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductWidget(
                        productModel: flashDealController.productList![index],
                      );
                    },
                    crossAxisCount: 2,
                  ),
                )
                : const Center(child: CircularProgressIndicator());
          },
        );
  }
}
