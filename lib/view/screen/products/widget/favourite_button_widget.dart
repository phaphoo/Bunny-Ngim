import 'package:bunny_ngim_app/controller/favorite_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final int? productId;
  final Product? product;
  final bool isFeatured;
  const FavouriteButtonWidget({
    super.key,
    this.backgroundColor = Colors.black,
    this.productId,
    this.product,
    this.isFeatured = false,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      builder: (favController) {
        bool isFav = favController.isFavorite(product!);
        return GestureDetector(
          onTap: () {
            favController.toggleFavorite(product!);
          },
          child: Container(
            // padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: Container(
                transform: Matrix4.translationValues(0, 1, 0),
                child: Icon(
                  isFav ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  color: isFav ? Colors.red : Theme.of(context).primaryColor,
                  size: isFeatured ? 25 : 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
