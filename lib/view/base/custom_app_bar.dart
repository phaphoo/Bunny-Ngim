import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/color_resources.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBarII(BuildContext context, bool login) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading:
        login
            ? null
            : Padding(
              padding: EdgeInsets.only(
                left:
                    ResponsiveHelper.isTab()
                        ? Dimensions.paddingSizeExtraLarge
                        : Dimensions.paddingSizeLarge,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  image: DecorationImage(
                    scale: 5,
                    image: AssetImage(Images.profileimage),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
    title:
        login
            ? Image.asset(Images.logo, fit: BoxFit.contain, width: 180)
            : Center(
              child: Image.asset(Images.logo, fit: BoxFit.contain, width: 120),
            ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(
          right: Dimensions.paddingSizeLarge,
          top: Dimensions.paddingSizeSmall,
          bottom: Dimensions.paddingSizeSmall,
        ),
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeLarge,
              ),
              child:
                  login
                      ? const Text(
                        "Login",
                        style: TextStyle(color: ColorResources.white),
                      )
                      : const Text(
                        "momka",
                        style: TextStyle(color: ColorResources.white),
                      ),
            ),
          ),
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
AppBar CustomAppBar(
  BuildContext context,
  String title, {
  bool isNavScreen = false,
}) {
  return AppBar(
    automaticallyImplyLeading: !isNavScreen,
    backgroundColor: Theme.of(context).primaryColor,
    elevation: 0,
    title: Text(
      title,
      style: titilliumRegular.copyWith(
        color: Theme.of(context).secondaryHeaderColor,
        fontSize: Dimensions.fontSizeExtraLarge,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(left: ResponsiveHelper.isTab() ? 20 : 0),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size:
              ResponsiveHelper.isTab()
                  ? Dimensions.iconSizeThirty
                  : Dimensions.iconSizeLarge,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Theme.of(context).secondaryHeaderColor,
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
AppBar CustomIIAppBar(
  BuildContext context,
  String title, {
  bool isNavScreen = false,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: titleRegular.copyWith(
        fontSize: Dimensions.fontSizeExtraLarge,
        color: Theme.of(context).secondaryHeaderColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading:
        isNavScreen
            ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Go back to the previous screen
              },
            )
            : const SizedBox(),
  );
}
