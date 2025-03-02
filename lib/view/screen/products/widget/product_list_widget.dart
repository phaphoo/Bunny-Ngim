import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/title_widget.dart';
import 'package:bunny_ngim_app/view/screen/category/category_products_screen.dart';
import 'package:bunny_ngim_app/view/screen/category/widgets/category_shimmer_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_list_tile_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  final bool isHomePage;
  const ProductListWidget({super.key, required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: TitleWidget(title: 'recommended'.tr, onTap: null),
            ),

            productController.productList != null &&
                    productController.productList!.isNotEmpty
                ? SizedBox(
                  height: MediaQuery.of(context).size.width / 1.6,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeSmall,
                      vertical: Dimensions.paddingSizeSmall,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.productList!.length,
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
                          productModel: productController.productList![index],
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
