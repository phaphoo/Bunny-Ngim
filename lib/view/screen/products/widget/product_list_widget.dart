import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/product_type.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/view_all_product_screen.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_list_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  final bool isHomePage;
  const ProductListWidget({super.key, required this.isHomePage});

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
                title: 'recommended_product'.tr,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AllProductScreen(
                              productType: ProductType.recommend,
                              appBarTitle: 'recommended_product',
                            ),
                      ),
                    ),
              ),
            ),

            productController.recommendedProductList != null &&
                    productController.recommendedProductList!.isNotEmpty
                ? SizedBox(
                  height: MediaQuery.of(context).size.width / 1.6,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall,
                      vertical: Dimensions.paddingSizeSmall,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.recommendedProductList!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                          //     isBrand: false,
                          //     id: productController.categoryList[index].id.toString(),
                          //     name: productController.categoryList[index].name)));
                        },
                        child: ProductListTileWidget(
                          productModel:
                              productController.recommendedProductList![index],
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
