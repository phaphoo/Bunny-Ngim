import 'package:bunny_ngim_app/api/api_checker.dart';
import 'package:bunny_ngim_app/model/response/product_model.dart';
import 'package:bunny_ngim_app/repository/product_repo.dart';
import 'package:get/get.dart';

class ProductController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  List<Product>? _productList;
  List<Product>? get productList => _productList;

  bool _filterFirstLoading = true;
  bool get filterFirstLoading => _filterFirstLoading;

  bool _filterIsLoading = false;
  bool get filterIsLoading => _filterIsLoading;

  bool _firstLoading = false;
  bool get firstLoading => _firstLoading;

  int _productTotalPage = 0;
  int get productTotalPage => _productTotalPage;

  final int _currentOffset = 0;
  int get currentOffset => _currentOffset;

  final List<int> _offsetList = [];
  List<int> get offsetList => _offsetList;

  Future<void> getAllProductList({
    int limit = 12,
    int offset = 1,
    bool reload = false,
  }) async {
    if (offset == 1 || reload) {
      _productModel = null;
      _productList = [];
      _filterFirstLoading = true;
      _filterFirstLoading = true;
      _firstLoading = true;
    }
    try {
      Response response = await productRepo.getAllProductData(
        limit: limit,
        offset: offset,
      );
      if (response.statusCode == 200) {
        _productModel = ProductModel.fromJson(response.body);
        if (ProductModel.fromJson(response.body).productsource!.data != null) {
          _productList!.addAll(
            ProductModel.fromJson(response.body).productsource!.data!,
          );
          _productTotalPage = _productModel!.productsource!.lastPage!;
        }

        print('_productList ${_productList!.first}');

        _filterFirstLoading = false;
        _filterIsLoading = false;
        _firstLoading = false;
      } else {
        ApiChecker.checkApi(response);
        _filterFirstLoading = false;
        _filterIsLoading = false;
        _firstLoading = false;
      }
      update();
    } catch (e) {
      _productList = [];
      _productTotalPage = 0;
      _filterFirstLoading = false;
      _filterIsLoading = false;
      _firstLoading = false;
    }
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }

  int? _featuredDealSelectedIndex;
  int? get featuredDealSelectedIndex => _featuredDealSelectedIndex;
  void changeSelectedIndex(int selectedIndex) {
    _featuredDealSelectedIndex = selectedIndex;
    update();
  }
}
