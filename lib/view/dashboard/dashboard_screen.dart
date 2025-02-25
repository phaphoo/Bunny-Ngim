import 'package:bunny_ngim_app/helper/responsive_helper.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/dashboard/bottomnavigation_menu_screen.dart';
import 'package:bunny_ngim_app/view/screen/account/account_screen.dart';
import 'package:bunny_ngim_app/view/screen/favorite/favorite_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/home_screen.dart';
import 'package:bunny_ngim_app/view/screen/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DashboardScreen extends StatefulWidget {
  final int? index;
  final int? groupId;
  final String? selectedCategoryName;
  final String? selectedTemplateName;
  final String? selectedTemplateImage;
  final int? cateIndex;
  final int? tempIndex;
  final bool isResultgenerate;

  final String? inputText;

  const DashboardScreen({
    super.key,
    this.isResultgenerate = true,
    this.selectedCategoryName,
    this.selectedTemplateName,
    this.selectedTemplateImage,
    this.cateIndex,
    this.inputText,
    this.index,
    this.groupId,
    this.tempIndex,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: widget.inputText ?? '',
    );
    super.initState();
  }

  late List<Widget> _screens;

  bool _isSelected0 = true;
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screens = [
      HomeScreen(),
      const OrderScreen(),
      const FavoriteScreen(),
      const AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: ResponsiveHelper.isTab() ? 100 : 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _isSelected0 = index == 0;
              _isSelected1 = index == 1;
              _isSelected2 = index == 2;
              _isSelected3 = index == 3;
            });
          },
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).cardColor,
          selectedLabelStyle: titilliumRegular.copyWith(
            fontSize: Dimensions.fontSizeSmall,
          ),
          unselectedLabelStyle: titleHeader.copyWith(
            fontSize: Dimensions.fontSizeExtraSmall,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    child: Image.asset(
                      Images.homeIcon,
                      color:
                          _isSelected0
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeSmall
                            : Dimensions.paddingSizeExtraSmall,
                  ),
                ],
              ),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(
                    width:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    child: Image.asset(
                      Images.history,
                      color:
                          _isSelected1
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeSmall
                            : Dimensions.paddingSizeExtraSmall,
                  ),
                ],
              ),
              label: 'history'.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(
                    width:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    child: Image.asset(
                      Images.heart,
                      color:
                          _isSelected2
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeSmall
                            : Dimensions.paddingSizeExtraSmall,
                  ),
                ],
              ),
              label: 'favorite'.tr,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SizedBox(
                    width:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeThirty
                            : Dimensions.paddingSizeExtraLarge,
                    child: Image.asset(
                      Images.profile,
                      color:
                          _isSelected3
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).hintColor,
                    ),
                  ),
                  SizedBox(
                    height:
                        ResponsiveHelper.isTab()
                            ? Dimensions.paddingSizeSmall
                            : Dimensions.paddingSizeExtraSmall,
                  ),
                ],
              ),
              label: 'account'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
