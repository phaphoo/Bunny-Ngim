import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ConfigRepo {
  final ApiClient apiClient;
  ConfigRepo({required this.apiClient});

  Future<Response> getConfigData() async {
    return await apiClient.getData(AppConstants.configUri);
  }
}
