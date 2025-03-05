import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlashDealShimmer extends StatelessWidget {
  const FlashDealShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: ResponsiveHelper.isTab() ? .5 : .7,
              autoPlay: false,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              enlargeFactor: 0.4,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {},
            ),
            itemCount: 2,
            itemBuilder: (context, index, _) {
              return SizedBox(
                height: ResponsiveHelper.isTab() ? 350 : 500,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).hintColor.withValues(alpha: 0.4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Theme.of(context).cardColor,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: ResponsiveHelper.isTab() ? 300 : 120,
                          padding: const EdgeInsets.all(
                            Dimensions.paddingSizeLarge,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).hintColor.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(
                            Dimensions.paddingSizeSmall,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 50,
                                    color: ColorResources.white,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: Dimensions.paddingSizeExtraSmall,
                              ),
                              Container(
                                height: Dimensions.paddingSizeLarge,
                                color: Theme.of(context).cardColor,
                              ),
                              const SizedBox(
                                height: Dimensions.paddingSizeDefault,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                ),
                                child: Container(
                                  height: Dimensions.paddingSizeLarge,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
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
    );
  }
}
