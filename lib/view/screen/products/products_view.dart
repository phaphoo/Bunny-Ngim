import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/base/product_type.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProductView extends StatefulWidget {
  final bool isHomePage;
  final ScrollController? scrollController;
  final String? sellerId;
  final ProductType productType;
  const ProductView({
    super.key,
    required this.isHomePage,
    this.scrollController,
    this.sellerId,
    this.productType = ProductType.allProduct,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int offset = 1;
  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() async {
    if (widget.scrollController!.position.pixels ==
            widget.scrollController!.position.maxScrollExtent &&
        Get.find<ProductController>().productList!.isNotEmpty &&
        widget.productType == ProductType.allProduct) {
      int pageSize = Get.find<ProductController>().productTotalPage;
      if (offset < pageSize) {
        offset++;
        print('Fetching page: $offset');
        await Get.find<ProductController>().getAllProductList(offset: offset);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (configController) {
        return GetBuilder<ProductController>(
          builder: (prodProvider) {
            List<Product>? productList = [];
            if (widget.productType == ProductType.allProduct) {
              productList = prodProvider.productList;
            } else if (widget.productType == ProductType.featuredProduct) {
              productList = configController.featuredProductList;
            } else if (widget.productType == ProductType.topProduct) {
              productList = configController.mostPopularProductList;
            } else if (widget.productType == ProductType.recommend) {
              productList = configController.recommendedProductList;
            }

            return Column(
              children: [
                !prodProvider.filterFirstLoading
                    ? (productList != null && productList.isNotEmpty)
                        ? MasonryGridView.count(
                          itemCount:
                              widget.isHomePage
                                  ? productList.length > 4
                                      ? 4
                                      : productList.length
                                  : productList.length,
                          crossAxisCount: 2,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductWidget(
                              productModel: productList![index],
                            );
                          },
                        )
                        : const NoInternetOrDataScreenWidget(
                          isNoInternet: false,
                        )
                    : ProductShimmer(
                      isHomePage: widget.isHomePage,
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
      },
    );
  }
}
