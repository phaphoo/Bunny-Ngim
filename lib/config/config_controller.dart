import 'package:bunny_ngim_app/api/api_checker.dart';
import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/model/response/config_model.dart';
import 'package:bunny_ngim_app/repository/config_repo.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController implements GetxService {
  final ConfigRepo configRepo;
  ConfigController({required this.configRepo});

  ConfigModel? _configModel;
  ConfigModel? get configModel => _configModel;
  bool _hasConnection = true;
  bool get hasConnection => _hasConnection;

  Future<bool> getConfigData() async {
    _hasConnection = true;

    Response response = await configRepo.getConfigData();
    bool _isSuccess = false;
    if (response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(response.body['devconfig']);
      print('_configModel ${_configModel!.toJson()}');
      _isSuccess = true;
    } else {
      ApiChecker.checkApi(response);
      if (response.statusText == ApiClient.noInternetMessage) {
        _hasConnection = false;
      }
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
