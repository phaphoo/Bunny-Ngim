import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/home/event/event_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/event/news_and_event_detail_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/event/widget/event_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/view_all_product_screen.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListWidget extends StatelessWidget {
  final bool isHomePage;
  const EventListWidget({super.key, required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (productController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: TitleWidget(
                title: 'new_and_event'.tr,
                onTap: () => Get.to(() => EventScreen()),
              ),
            ),

            productController.newEvent != null &&
                    productController.newEvent!.isNotEmpty
                ? SizedBox(
                  height: Get.width / 2.2,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall,
                      vertical: Dimensions.paddingSizeSmall,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.newEvent!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(
                            () => NewAndEventDetailScreen(
                              event: productController.newEvent![index],
                            ),
                          );
                        },
                        child: EventWidget(
                          newEventModel: productController.newEvent![index],
                        ),
                      );
                    },
                  ),
                )
                : const ProductListShimmer(isEnabled: true, isHomePage: true),
          ],
        );
      },
    );
  }
}
