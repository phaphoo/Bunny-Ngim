import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:get/get.dart';

class CategoryRepo {
  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});

  final localization = Get.find<LocalizationController>();
  String lang = 'en';

  Future<Response> getProductByCateData(
    String? cateId, {
    int limit = 10,
    int offset = 1,
  }) async {
    lang = localization.currentLanguageCode;
    return await apiClient.getData(
      '${AppConstants.productUri}?perpage=$limit&page=$offset&lang=$lang&category_id=$cateId',
    );
  }

  Future<Response> getAllProductByCateList({
    int limit = 10,
    int offset = 1,
  }) async {
    lang = localization.locale.languageCode;
    return await apiClient.getData(
      '${AppConstants.productUri}?perpage=$limit&page=$offset&lang=$lang',
    );
  }

  Future<Response> getCategoryList() async {
    lang = localization.locale.languageCode;
    return await apiClient.getData('${AppConstants.cateUri}?lang=$lang');
  }
}
