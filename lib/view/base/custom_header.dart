import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_back_button.dart';
import 'package:flutter/material.dart';

class CustomeHeader extends StatelessWidget {
  final String titleName;
  final dynamic action;
  const CustomeHeader({super.key, required this.titleName, this.action});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 0,
      centerTitle: true,
      leading: const CustomBackButton(),
      leadingWidth: 55,
      title: Text(
        titleName,
        style: titleHeader.copyWith(
          fontSize: Dimensions.fontSizeExtraLarge,
          color: Theme.of(context).primaryColor,
        ),
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [],
    );
  }
}
