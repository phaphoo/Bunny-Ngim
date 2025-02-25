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
    return GetBuilder<BannerController>(
      builder: (bannerController) {
        return Column(
          children: [
            Stack(
              children: [
                bannerController.mainBannerList != null
                    ? bannerController.mainBannerList!.isNotEmpty
                        ? SizedBox(
                          height: width * 0.4,
                          width: width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: width * 0.33,
                                width: width,
                                child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    aspectRatio: 4 / 1,
                                    viewportFraction: 0.8,
                                    autoPlay: true,
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
                                      // Provider.of<BannerController>(
                                      //   context,
                                      //   listen: false,
                                      // ).setCurrentIndex(index);
                                    },
                                  ),
                                  itemCount:
                                      bannerController.mainBannerList!.isEmpty
                                          ? 1
                                          : bannerController
                                              .mainBannerList
                                              ?.length,
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
                                                '${bannerController.mainBannerList?[index]}',
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

                if (bannerController.mainBannerList != null &&
                    bannerController.mainBannerList!.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              bannerController.mainBannerList!.map((banner) {
                                int index = bannerController.mainBannerList!
                                    .indexOf(banner);
                                return index == bannerController.currentIndex
                                    ? Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 3,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 6.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        "${bannerController.mainBannerList!.indexOf(banner) + 1}/ ${bannerController.mainBannerList!.length}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                    : const SizedBox();
                              }).toList(),
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
