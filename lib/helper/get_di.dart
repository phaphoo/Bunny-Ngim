import 'dart:convert';
import 'package:bunny_ngim_app/api/api_client.dart';
import 'package:bunny_ngim_app/config/config_controller.dart';
import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/controller/banner_controller.dart';
import 'package:bunny_ngim_app/controller/category_controller.dart';
import 'package:bunny_ngim_app/controller/product_controller.dart';
import 'package:bunny_ngim_app/controller/sms_controller.dart';
import 'package:bunny_ngim_app/model/response/language_model.dart';
import 'package:bunny_ngim_app/repository/category_repo.dart';
import 'package:bunny_ngim_app/repository/config_repo.dart';
import 'package:bunny_ngim_app/repository/product_repo.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.BaseUrl,
      sharedPreferences: Get.find(),
    ),
  );
  //Repo
  // Get.lazyPut(
  //   () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
  // );
  // Get.lazyPut(() => AccountRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  // Get.lazyPut(() => TemplateRepo(apiClient: Get.find()));
  // Get.lazyPut(() => PlanRepo(apiClient: Get.find()));
  // //Get.lazyPut(() => ProfileRepo(apiClient: Get.find()));
  // Get.lazyPut(() => CurrentRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ConfigRepo(apiClient: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocalizationController());
  Get.lazyPut(() => SMSController());
  Get.lazyPut(() => BannerController());
  Get.lazyPut(() => ConfigController(configRepo: Get.find<ConfigRepo>()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find<CategoryRepo>()));
  Get.lazyPut(() => ProductController(productRepo: Get.find<ProductRepo>()));

  // //Controller lazyput
  // Get.lazyPut(
  //   () => AuthController(Get.find(), Get.find(), authRepo: Get.find()),
  // );
  // Get.lazyPut(() => AccountController(Get.find<AccountRepo>()));
  // Get.lazyPut(() => CategoryController(Get.find<CategoryRepo>()));
  // Get.lazyPut(() => TemplateController(Get.find<TemplateRepo>()));
  // Get.lazyPut(() => PlanController(Get.find<PlanRepo>()));
  // Get.lazyPut(() => SMSController());

  // Get.lazyPut(() => HistoryController(Get.find<HistoryRepo>()));
  // Get.lazyPut(() => CurrentController(Get.find<CurrentRepo>()));
  // Get.lazyPut(() => InvoiceController(Get.find<InvoiceRepo>()));
  // Get.lazyPut(() => DocumentController(Get.find<DocumentRepo>()));

  // //Controller put
  // Get.put(() => AuthController(Get.find(), Get.find(), authRepo: Get.find()));
  // Get.put(() => AccountController(Get.find<AccountRepo>()));
  // Get.put(() => CategoryController(Get.find<CategoryRepo>()));
  // Get.put(() => TemplateController(Get.find<TemplateRepo>()));
  // Get.put(() => PlanController(Get.find<PlanRepo>()));
  // Get.put(() => HistoryController(Get.find<HistoryRepo>()));
  // Get.put(() => CurrentController(Get.find<CurrentRepo>()));
  // Get.put(() => InvoiceController(Get.find<InvoiceRepo>()));
  // Get.put(() => DocumentController(Get.find<DocumentRepo>()));
  // Get.put(() => DocumentController(Get.find<DocumentRepo>()));
  // Get.put(() => SMSController());

  // Get.lazyPut(() => SaleController(saleRepo: Get.find()));
  // Get.lazyPut(() => ShopController(shopRepo: Get.find()));
  // Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  // Get.lazyPut(() => LocationRepo(apiClient: Get.find()));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle.loadString(
      'assets/language/${languageModel.languageCode}.json',
    );
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _languages;
}
