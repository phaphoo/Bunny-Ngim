import 'package:bunny_ngim_app/util/images.dart';
import 'package:get/get.dart';

class BannerController extends GetxController implements GetxService {
  List<String>? _bannerImageList;
  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  List<String>? mainBannerList = [
    Images.afterslash,
    Images.afterslash,
    Images.afterslash,
  ];

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    update();
  }
}
