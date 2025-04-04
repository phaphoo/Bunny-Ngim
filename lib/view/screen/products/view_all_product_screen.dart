import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/product_type.dart';
import 'package:bunny_ngim_app/view/screen/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  final ProductType productType;
  final String appBarTitle;
  final ScrollController _scrollController = ScrollController();
  AllProductScreen({
    super.key,
    this.productType = ProductType.allProduct,
    this.appBarTitle = 'all_product',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: appBarTitle.tr, isBackButtonExist: true),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: ProductView(
                      isHomePage: false,
                      productType: productType,
                      scrollController: _scrollController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
