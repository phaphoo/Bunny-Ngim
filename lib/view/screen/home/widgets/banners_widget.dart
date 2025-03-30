import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/controller/banner_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/home/widgets/banner_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ConfigController>(
      builder: (bannerController) {
        return Column(
          children: [
            Stack(
              children: [
                bannerController.bannerList != null
                    ? bannerController.bannerList!.isNotEmpty
                        ? SizedBox(
                          height: width * 0.4,
                          width: width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.35,
                                width: width,
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    aspectRatio: 4 / 1,
                                    viewportFraction: 0.8,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 5),
                                    pauseAutoPlayOnTouch: true,
                                    pauseAutoPlayOnManualNavigate: true,
                                    pauseAutoPlayInFiniteScroll: true,
                                    enlargeFactor: .2,
                                    enlargeCenterPage: true,
                                    disableCenter: true,
                                    onPageChanged: (index, reason) {
                                      bannerController.setCurrentIndex(
                                        index,
                                        true,
                                      );
                                    },
                                  ),
                                  itemCount:
                                      bannerController.bannerList!.isEmpty
                                          ? 1
                                          : bannerController.bannerList?.length,
                                  itemBuilder: (context, index, _) {
                                    return InkWell(
                                      onTap: () {},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          Dimensions.paddingSizeSmall,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.paddingSizeSmall,
                                            ),
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withValues(alpha: .05),
                                          ),
                                          child: CustomImage(
                                            image:
                                                bannerController
                                                            .bannerList?[index]
                                                            .imginfo !=
                                                        null
                                                    ? '${bannerController.bannerList?[index].imginfo!.filepath}'
                                                    : "",
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                        : const SizedBox()
                    : const BannerShimmer(),
                if (bannerController.bannerList != null &&
                    bannerController.bannerList!.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        bannerController.bannerList!.length,
                        (index) => Container(
                          width: Dimensions.iconSizeSmall - 2,
                          height: Dimensions.iconSizeSmall - 2,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color:
                                bannerController.currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).hintColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          ],
        );
      },
    );
  }
}
