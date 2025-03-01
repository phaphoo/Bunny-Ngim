import 'package:bunny_ngim_app/view/base/custom_app_bar_widget.dart';
import 'package:bunny_ngim_app/view/base/no_internet_screen_widget.dart';
import 'package:bunny_ngim_app/view/screen/products/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:bunny_ngim_app/controller/favorite_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';

class FavoriteScreen extends StatefulWidget {
  final bool isBackToExit;
  const FavoriteScreen({super.key, this.isBackToExit = false});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Get.find<FavoriteController>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'favorite'.tr,
        isBackButtonExist: widget.isBackToExit,
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) {
          if (controller.favoriteProducts.isEmpty) {
            return Center(
              child: NoInternetOrDataScreenWidget(
                isNoInternet: false,
                message: "favorite_is_empty".tr,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.count(
              itemCount: controller.favoriteProducts.length,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                Product product = controller.favoriteProducts[index];
                return ProductWidget(productModel: product);
              },
            ),
          );
        },
      ),
    );
  }
}
