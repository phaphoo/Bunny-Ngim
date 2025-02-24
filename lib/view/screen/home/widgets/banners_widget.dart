import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:bunny_ngim_app/view/screen/home/widgets/banner_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannersWidget extends StatelessWidget {
  const BannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>? mainBannerList = [
      Images.afterslash,
      Images.afterslash,
      Images.afterslash,
    ];
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            mainBannerList != null
                ? mainBannerList!.isNotEmpty
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
                                  // Provider.of<BannerController>(
                                  //   context,
                                  //   listen: false,
                                  // ).setCurrentIndex(index);
                                },
                              ),
                              itemCount:
                                  mainBannerList!.isEmpty
                                      ? 1
                                      : mainBannerList?.length,
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
                                        color: Theme.of(
                                          context,
                                        ).primaryColor.withValues(alpha: .05),
                                      ),
                                      child: CustomImage(
                                        image: '${mainBannerList?[index]}',
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

            if (mainBannerList != null && mainBannerList!.isNotEmpty)
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
                          mainBannerList!.map((banner) {
                            int index = mainBannerList!.indexOf(banner);
                            return index == 0
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
                                    "${mainBannerList!.indexOf(banner) + 1}/ ${mainBannerList!.length}",
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
  }
}
