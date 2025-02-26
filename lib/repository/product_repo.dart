import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:get/get.dart';

class ProductRepo {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});
  final localization = Get.find<LocalizationController>();
  String lang = '';

  Future<Response> getAllProductData({int limit = 10, int offset = 1}) async {
    lang = Get.find<LocalizationController>().locale.languageCode;
    return await apiClient.getData(
      '${AppConstants.productUri}?perpage=$limit&page=$offset&lang=$lang',
    );
  }
}
