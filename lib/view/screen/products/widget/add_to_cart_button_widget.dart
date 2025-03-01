import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final int? productId;
  final Product? product;
  final bool isFeatured;
  const AddToCartButtonWidget({
    super.key,
    this.backgroundColor = Colors.black,
    this.productId,
    this.product,
    this.isFeatured = false,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cartController = Get.find<CartController>();
        cartController.addToCart(product!, qty: 1);
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
            child: Image.asset(
              Images.basket,
              color: Theme.of(context).secondaryHeaderColor,
              width: isFeatured ? 25 : 16,
            ),
          ),
        ),
      ),
    );
  }
}
