import 'package:bunny_ngim_app/controller/cart_controller.dart';
import 'package:bunny_ngim_app/model/response/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartQuantityButton extends StatelessWidget {
  final CartItem? cartModel;
  final bool isIncrement;
  final int? quantity;
  const CartQuantityButton({
    super.key,
    required this.isIncrement,
    required this.quantity,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartProvider) {
        return InkWell(
          onTap: () {
            if (!isIncrement) {
              cartProvider.updateQty(cartModel!.product, false);
            } else {
              cartProvider.updateQty(cartModel!.product, true);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              isIncrement
                  ? CupertinoIcons.add
                  : quantity! == 1
                  ? CupertinoIcons.delete_solid
                  : CupertinoIcons.minus,
              color: Colors.red,
              size: 15,
            ),
          ),
        );
      },
    );
  }
}
