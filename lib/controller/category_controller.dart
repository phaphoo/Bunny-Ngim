import 'package:bunny_ngim_app/api/api_checker.dart';
import 'package:bunny_ngim_app/model/response/category_model.dart';
import 'package:bunny_ngim_app/repository/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController implements GetxService {
  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});

  List<CategoryModel>? _categoryList;
  List<CategoryModel>? get categoryList => _categoryList;

  Future<void> getCategoryList() async {
    Response response = await categoryRepo.getCategoryList();

    if (response.statusCode == 200) {
      _categoryList = [];
      response.body['cat_tree'].forEach((v) {
        _categoryList!.add(CategoryModel.fromJson(v));
      });
    } else {
      ApiChecker.checkApi(response);
    }
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
}
