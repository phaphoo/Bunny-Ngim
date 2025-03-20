import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:get/get.dart';

class ConfigRepo {
  final ApiClient apiClient;
  ConfigRepo({required this.apiClient});
  final localization = Get.find<LocalizationController>();
  String lang = 'en';

  Future<Response> getConfigData() async {
    lang = localization.locale.languageCode;
    return await apiClient.getData('${AppConstants.configUri}?lang=$lang');
  }

  Future<Response> getHomePageData() async {
    lang = localization.locale.languageCode;
    return await apiClient.getData('${AppConstants.homePageUri}?lang=$lang');
  }
}
