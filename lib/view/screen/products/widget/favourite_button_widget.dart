import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final int? productId;
  const FavouriteButtonWidget({
    super.key,
    this.backgroundColor = Colors.black,
    this.productId,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              CupertinoIcons.heart,
              color: Theme.of(context).primaryColor,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
