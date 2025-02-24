import 'package:bunny_ngim_app/model/response/language_model.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_cache/flutter_cache.dart' as cache;

class LocalizationController extends GetxController implements GetxService {
  LocalizationController() {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(
    AppConstants.languages[0].languageCode!,
    AppConstants.languages[0].countryCode,
  );
  List<LanguageModel> _languages = AppConstants.languages;
  Locale get locale => _locale;
  List<LanguageModel> get languages => _languages;

  void setLanguage(Locale locale) {
    Get.updateLocale(locale);
    _locale = locale;

    saveLanguage(_locale);

    update();
  }

  void loadCurrentLanguage() async {
    _locale = Locale(
      await cache.load(
        AppConstants.LANGUAGE_CODE,
        AppConstants.languages[0].languageCode,
      ),
      await cache.load(
        AppConstants.COUNTRY_CODE,
        AppConstants.languages[0].countryCode,
      ),
    );
    for (int index = 0; index < AppConstants.languages.length; index++) {
      if (AppConstants.languages[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(AppConstants.languages);
    update();
  }

  void saveLanguage(Locale locale) async {
    cache.write(AppConstants.LANGUAGE_CODE, locale.languageCode);
    cache.write(AppConstants.COUNTRY_CODE, locale.countryCode);
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }
}
