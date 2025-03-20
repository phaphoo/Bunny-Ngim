import 'package:bunny_ngim_app/api/api_checker.dart';
import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/model/response/banner_model.dart';
import 'package:bunny_ngim_app/model/response/company_model.dart';
import 'package:bunny_ngim_app/model/response/config_model.dart';
import 'package:bunny_ngim_app/model/response/contact_model.dart';
import 'package:bunny_ngim_app/model/response/main_manu_model.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/model/response/province_model.dart';
import 'package:bunny_ngim_app/repository/config_repo.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController implements GetxService {
  final ConfigRepo configRepo;
  ConfigController({required this.configRepo});

  ConfigModel? _configModel;
  ConfigModel? get configModel => _configModel;
  ContactModel? _contactModel;
  ContactModel? get contactModel => _contactModel;
  CompanyProfileModel? _companyProfile;
  CompanyProfileModel? get companyProfile => _companyProfile;
  ProvinceModel? _provinceModel;
  ProvinceModel? get provinceModel => _provinceModel;
  String? _filePath;
  String? get filePath => _filePath;
  String? _publicPath;
  String? get publicPath => _publicPath;

  List<BannerModel>? _bannerList;
  List<BannerModel>? get bannerList => _bannerList;

  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  List<MainMenu>? _mainMenusList;
  List<MainMenu>? get mainMenusList => _mainMenusList;
  bool _hasConnection = true;
  bool get hasConnection => _hasConnection;
  List<Product>? _featuredProductList;
  List<Product>? get featuredProductList => _featuredProductList;
  List<Product>? _mostPopularProductList;
  List<Product>? get mostPopularProductList => _mostPopularProductList;
  List<Product>? _recommendedProductList;
  List<Product>? get recommendedProductList => _recommendedProductList;

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  Future<bool> getConfigData() async {
    _hasConnection = true;

    Response response = await configRepo.getConfigData();
    bool isSuccess = false;
    if (response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(response.body['devconfig']);
      _companyProfile = CompanyProfileModel.fromJson(response.body['profile']);
      _contactModel = ContactModel.fromJson(response.body['contactus']);
      _provinceModel = ProvinceModel.fromJson(response.body['provinces']);
      _mainMenusList = [];
      response.body['mainmenu'].forEach((menu) {
        _mainMenusList!.add(MainMenu.fromJson(menu));
      });
      _filePath = response.body['filepath'];
      _publicPath = response.body['publicfilepath'];
      isSuccess = true;
    } else {
      ApiChecker.checkApi(response);
      if (response.statusText == ApiClient.noInternetMessage) {
        _hasConnection = false;
      }
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  Future<void> getHomePageData() async {
    Response response = await configRepo.getHomePageData();
    if (response.statusCode == 200) {
      _bannerList = [];
      _featuredProductList = [];
      _mostPopularProductList = [];
      _recommendedProductList = [];
      response.body['slider'].forEach((banner) {
        _bannerList!.add(BannerModel.fromJson(banner));
      });
      response.body['featuredproducts'].forEach((featured) {
        _featuredProductList!.add(Product.fromJson(featured));
      });
      response.body['mostpopularproducts'].forEach((featured) {
        _mostPopularProductList!.add(Product.fromJson(featured));
      });
      response.body['recommendedproducts'].forEach((featured) {
        _recommendedProductList!.add(Product.fromJson(featured));
      });
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  int? _featuredDealSelectedIndex;
  int? get featuredDealSelectedIndex => _featuredDealSelectedIndex;
  void changeSelectedIndex(int selectedIndex) {
    _featuredDealSelectedIndex = selectedIndex;
    update();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }

  int _mostPopularSeletedIndex = 0;
  int get mostPopularSeletedIndex => _mostPopularSeletedIndex;

  void changeMostPopIndex(int index, bool notify) {
    _mostPopularSeletedIndex = index;
    if (notify) {
      update();
    }
  }
}
