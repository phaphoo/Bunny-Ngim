import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/featured_deal_card_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/find_what_you_need_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FeaturedDealsListWidget extends StatelessWidget {
  final bool isHomePage;
  const FeaturedDealsListWidget({super.key, this.isHomePage = true});

  @override
  Widget build(BuildContext context) {
    return isHomePage
        ? GetBuilder<ConfigController>(
          builder: (featuredController) {
            return featuredController.featuredProductList != null
                ? featuredController.featuredProductList!.isNotEmpty
                    ? CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 2.5,
                        viewportFraction: 0.86,
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        pauseAutoPlayOnManualNavigate: true,
                        pauseAutoPlayInFiniteScroll: true,
                        enlargeFactor: 0.2,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        disableCenter: true,
                        onPageChanged:
                            (index, reason) =>
                                featuredController.changeSelectedIndex(index),
                      ),
                      itemCount: featuredController.featuredProductList?.length,
                      itemBuilder:
                          (context, index, _) => FeaturedDealWidget(
                            isHomePage: isHomePage,
                            product:
                                featuredController.featuredProductList![index],
                            isCenterElement:
                                index ==
                                featuredController.featuredDealSelectedIndex,
                          ),
                    )
                    : const SizedBox()
                : const FindWhatYouNeedShimmer();
          },
        )
        : GetBuilder<ConfigController>(
          builder: (featuredController) {
            return RepaintBoundary(
              child: MasonryGridView.count(
                itemCount: featuredController.featuredProductList?.length,
                crossAxisCount: ResponsiveHelper.isTab() ? 3 : 2,
                padding: const EdgeInsets.all(0),
                itemBuilder:
                    (BuildContext context, int index) => ProductWidget(
                      productModel:
                          featuredController.featuredProductList![index],
                    ),
              ),
            );
          },
        );
  }
}
