import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:get/get.dart';

class Dimensions {
  static double get fontSizeExtraSmall =>
      ResponsiveHelper.isTab()
          ? 16
          : (Get.context?.width ?? 0) >= 1300
          ? 14
          : 10;

  static double get fontSizeSmall =>
      ResponsiveHelper.isTab()
          ? 22
          : (Get.context?.width ?? 0) >= 1300
          ? 16
          : 12;

  static double get fontSizeDefault =>
      ResponsiveHelper.isTab()
          ? 24
          : (Get.context?.width ?? 0) >= 1300
          ? 18
          : 14;

  static double get fontSizeLarge =>
      ResponsiveHelper.isTab()
          ? 26
          : (Get.context?.width ?? 0) >= 1300
          ? 20
          : 16;

  static double get fontSizeExtraLarge =>
      ResponsiveHelper.isTab()
          ? 28
          : (Get.context?.width ?? 0) >= 1300
          ? 22
          : 20;

  static double get fontSizeOverLarge =>
      ResponsiveHelper.isTab()
          ? 34
          : (Get.context?.width ?? 0) >= 1300
          ? 28
          : 24;

  static const double paddingSizeExtraExtraSmall = 2.0;
  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeSmaller = 13.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeThirty = 30.0;
  static const double paddingSizeThirtyFive = 35.0;
  static const double paddingSizeForty = 40.0;
  static const double paddingSizeFortyFive = 45.0;
  static const double paddingSizeOverLarge = 50.0;

  static const double marginSizeExtraSmall = 5.0;
  static const double marginSizeSmall = 10.0;
  static const double marginSizeDefault = 15.0;
  static const double marginSizeLarge = 20.0;
  static const double marginSizeExtraLarge = 25.0;
  static const double marginSizeThirty = 30.0;
  static const double marginSizeOverLarge = 50.0;

  static const double iconSizeExtraSmall = 5.0;
  static const double iconSizeSmall = 10.0;
  static const double iconSizeDefault = 15.0;
  static const double iconSizeLarge = 20.0;
  static const double iconSizeExtraLarge = 25.0;
  static const double iconSizeThirty = 30.0;
  static const double iconSizeOverLarge = 50.0;

  static const double radiusSizeExtraSmall = 5.0;
  static const double radiusSizeSmall = 10.0;
  static const double radiusSizeDefault = 15.0;
  static const double radiusSizeLarge = 20.0;

  static const double WEB_MAX_WIDTH = 1170;
  static const double WEB_MAX_HEIGHT = 5000;
  static const int MESSAGE_INPUT_LENGTH = 250;

  static double sizeSmallIcon =
      ResponsiveHelper.isTab() ? 24 : (Get.context!.width >= 1300 ? 18 : 14);

  static double sizeMediumIcon =
      ResponsiveHelper.isTab() ? 28 : (Get.context!.width >= 1300 ? 22 : 18);

  static double sizeDefaultIcon =
      ResponsiveHelper.isTab() ? 34 : (Get.context!.width >= 1300 ? 28 : 24);

  static double sizeLargeIcon =
      ResponsiveHelper.isTab() ? 44 : (Get.context!.width >= 1300 ? 38 : 34);
}
