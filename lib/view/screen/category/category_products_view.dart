import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoryProductView extends StatefulWidget {
  final bool isAll;
  final String cateId;
  final bool isHomePage;
  final ScrollController? scrollController;

  const CategoryProductView({
    super.key,
    required this.isHomePage,
    this.scrollController,
    this.isAll = true,
    required this.cateId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CategoryProductViewState createState() => _CategoryProductViewState();
}

class _CategoryProductViewState extends State<CategoryProductView> {
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
        Get.find<CategoryController>().productList!.isNotEmpty) {
      int pageSize = Get.find<CategoryController>().productTotalPage;
      if (offset < pageSize) {
        offset++;
        print('Fetching page: $offset');
        await Get.find<CategoryController>().getProductByCateData(
          widget.cateId,
          offset: offset,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (prodProvider) {
        List<Product>? productList = prodProvider.productList;

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
                        return ProductWidget(productModel: productList[index]);
                      },
                    )
                    : const NoInternetOrDataScreenWidget(isNoInternet: false)
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
  }
}
