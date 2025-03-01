import 'package:bunny_ngim_app/helper/network_info.dart';
import 'package:bunny_ngim_app/util/dimensions.dart';
import 'package:bunny_ngim_app/util/images.dart';
import 'package:bunny_ngim_app/util/text_styles.dart';
import 'package:bunny_ngim_app/view/base/custom_exit_card.dart';
import 'package:bunny_ngim_app/view/screen/account/account_screen.dart';
import 'package:bunny_ngim_app/view/screen/cart/cart_screen.dart';
import 'package:bunny_ngim_app/view/screen/favorite/favorite_screen.dart';
import 'package:bunny_ngim_app/view/screen/home/home_screen.dart';
import 'package:bunny_ngim_app/view/screen/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  int _pageIndex = 0;
  late List<NavigationModel> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();
    singleVendor = false;

    _screens = [
      NavigationModel(
        name: 'home',
        icon: Images.homePage,
        screen: const HomeScreen(),
      ),

      NavigationModel(
        name: 'my_cart',
        icon: Images.cart,
        screen: CartScreen(isBackToExit: false),
      ),

      NavigationModel(
        name: 'history',
        icon: Images.noteIcon,
        screen: OrderScreen(isBackToExit: false),
      ),

      NavigationModel(
        name: 'favorite',
        icon: Images.like,
        screen: FavoriteScreen(isBackToExit: false),
      ),

      NavigationModel(
        name: 'account',
        icon: Images.avatarIcon,
        screen: const AccountScreen(isBackToExit: false),
      ),
    ];

    NetworkInfo.checkConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => const CustomExitCard(),
          );
        }
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: PageStorage(bucket: bucket, child: _screens[_pageIndex].screen),
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(Dimensions.paddingSizeLarge),
            ),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 1,
                color: Theme.of(context).primaryColor.withOpacity(.125),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getBottomWidget(singleVendor),
          ),
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }

  List<Widget> _getBottomWidget(bool isSingleVendor) {
    List<Widget> list = [];
    for (int index = 0; index < _screens.length; index++) {
      list.add(
        Expanded(
          child: CustomMenuItem(
            isSelected: _pageIndex == index,
            name: _screens[index].name,
            icon: _screens[index].icon,
            onTap: () => _setPage(index),
          ),
        ),
      );
    }
    return list;
  }
}

class CustomMenuItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String icon;
  final VoidCallback onTap;

  const CustomMenuItem({
    super.key,
    required this.isSelected,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        child: SizedBox(
          width: isSelected ? 100 : 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                icon,
                color:
                    isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).hintColor,
                width: Dimensions.paddingSizeExtraLarge,
                height: Dimensions.paddingSizeExtraLarge,
              ),
              isSelected
                  ? Text(
                    name.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titilliumBold.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                  )
                  : Text(
                    name.tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titilliumRegular.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                    strutStyle: const StrutStyle(forceStrutHeight: true),
                  ),
              if (isSelected)
                Container(
                  width: 5,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.paddingSizeDefault,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationModel {
  String name;
  String icon;
  Widget screen;
  NavigationModel({
    required this.name,
    required this.icon,
    required this.screen,
  });
}
