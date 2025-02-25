import 'package:bunny_ngim_app/util/images.dart';
import 'package:get/get.dart';

class BannerController extends GetxController implements GetxService {
  List<String>? _bannerImageList;
  int? _currentIndex;
  int? get currentIndex => _currentIndex;

  List<String>? mainBannerList = [
    Images.slider1,
    Images.slider2,
    Images.slider3,
  ];

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    update();
  }
}
