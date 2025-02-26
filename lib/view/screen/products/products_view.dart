import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final bool isHomePage;
  final ScrollController? scrollController;
  final String? sellerId;
  const ProductView({
    super.key,
    required this.isHomePage,
    this.scrollController,
    this.sellerId,
  });

  @override
  Widget build(BuildContext context) {
    int offset = 1;
    scrollController!.addListener(() async {
      if (scrollController!.position.maxScrollExtent ==
              scrollController!.position.pixels &&
          Get.find<ProductController>().productList!.isNotEmpty) {
        int pageSize = Get.find<ProductController>().productTotalPage;

        if (offset < pageSize) {
          offset++;
          await Get.find<ProductController>().getAllProductList(offset: offset);
        }
      }
    });

    return GetBuilder<ProductController>(
      builder: (prodProvider) {
        List<Product>? productList = [];

        productList = prodProvider.productList;

        return Column(
          children: [
            !prodProvider.filterFirstLoading
                ? (productList != null && productList.isNotEmpty)
                    ? MasonryGridView.count(
                      itemCount:
                          isHomePage
                              ? productList.length > 4
                                  ? 4
                                  : productList.length
                              : productList.length,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(productModel: productList![index]);
                      },
                    )
                    : const NoInternetOrDataScreenWidget(isNoInternet: false)
                : ProductShimmer(
                  isHomePage: isHomePage,
                  isEnabled: prodProvider.firstLoading,
                ),
            prodProvider.filterIsLoading
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.iconSizeExtraSmall,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
