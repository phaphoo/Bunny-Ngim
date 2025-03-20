import 'package:bunny_ngim_app/model/response/language_model.dart';
import 'package:bunny_ngim_app/util/images.dart';

class AppConstants {
  static const String BaseUrl = "https://airlyo.com";
  static const String NAME = 'PFK';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String zoneTopic = '/data';
  static const String countryCode = '/data';
  static const String configUri = "/frontend/pfk/pfk";
  static const String homePageUri = "/frontend/pfk/pfk/home";
  static const String cateUri = "/frontend/pfk/pfk";
  static const String productUri = "/frontend/pfk/pfk/productlisting";
  static const String getResultHistoryUri =
      '/api/v1/documents/get_history_details';
  static const String GET_HISTORY = "/api/v1/documents/get_history";
  // sharekey
  static const String TOKEN = 'access_token';
  static const String languageCode = 'eoconten_language_code';
  static const String SET_USER_ID = 'id';
  static const String LANG_KEY = 'lang';
  static const String FIREBASE_TOKEN_URI =
      '$BaseUrl/api/student/update-fcm-token';

  static String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';
  static const String intro = 'intro';
  static const String TOPIC = 'topic';

  //chat buble

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.usa,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.khmer,
      languageName: 'ភាសាខ្មែរ',
      countryCode: 'KH',
      languageCode: 'km',
    ),
  ];
}
