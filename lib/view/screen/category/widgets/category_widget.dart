import 'package:bunny_ngim_app/model/response/category_model.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/painter/custom_image.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final int length;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.index,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall + 3),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 6.5,
            width: MediaQuery.of(context).size.width / 6.5,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor.withValues(alpha: .125),
                width: .25,
              ),
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              color: Theme.of(context).primaryColor.withValues(alpha: .125),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              child: CustomImage(image: '${category.categories[index]}'),
            ),
          ),

          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 6.5,
              child: Text(
                category.categories[index] ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: titilliumRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: ColorResources.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
