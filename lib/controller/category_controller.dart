import 'package:bunny_ngim_app/api/api_checker.dart';
import 'package:bunny_ngim_app/model/response/category_model.dart';
import 'package:bunny_ngim_app/repository/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController implements GetxService {
  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});

  CategoryModel? _categoryModel;
  CategoryModel? get categoryModel => _categoryModel;
  List<String>? _categoryList;
  List<String>? get categoryList => _categoryList;

  Future<bool> getCategoryList() async {
    Response response = await categoryRepo.getCategoryList();
    bool _isSuccess = false;
    if (response.statusCode == 200) {
      _categoryModel = CategoryModel.fromJson(response.body['category_list']);
      print('_categoryModel ${_categoryModel!.toJson()}');

      _isSuccess = true;
    } else {
      ApiChecker.checkApi(response);

      _isSuccess = false;
    }
    update();
    return _isSuccess;
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }
}
