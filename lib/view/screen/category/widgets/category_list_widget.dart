import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/category/category_screen.dart';
import 'package:bunny_ngim_app/view/screen/category/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_shimmer_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final bool isHomePage;
  const CategoryListWidget({super.key, required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (categoryProvider) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: TitleWidget(
                title: 'category'.tr,
                onTap: () {
                  if (categoryProvider.categoryList!.isNotEmpty) {
                    Get.to(() => CategoryScreen(isBackToExit: true));
                  }
                },
              ),
            ),

            categoryProvider.categoryList!.isNotEmpty
                ? SizedBox(
                  height: MediaQuery.of(context).size.width / 3.3,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryProvider.categoryList!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                          //     isBrand: false,
                          //     id: categoryProvider.categoryList[index].id.toString(),
                          //     name: categoryProvider.categoryList[index].name)));
                        },
                        child: CategoryWidget(
                          category: categoryProvider.categoryList![index],
                          index: index,
                          length: categoryProvider.categoryList!.length,
                        ),
                      );
                    },
                  ),
                )
                : const CategoryShimmerWidget(),
          ],
        );
      },
    );
  }
}
