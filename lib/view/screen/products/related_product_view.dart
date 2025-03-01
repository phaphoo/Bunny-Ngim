import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_shimmer.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class RelatedProductView extends StatelessWidget {
  const RelatedProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (prodProvider) {
        return Column(
          children: [
            prodProvider.productList != null
                ? prodProvider.productList!.isNotEmpty
                    ? MasonryGridView.count(
                      padding: EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount:
                          prodProvider.productList!.length > 8
                              ? 8
                              : prodProvider.productList!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(
                          productModel: prodProvider.productList![index],
                        );
                      },
                    )
                    : Center(child: Text('no_related_product'.tr))
                : ProductShimmer(isHomePage: false, isEnabled: false),
          ],
        );
      },
    );
  }
}
