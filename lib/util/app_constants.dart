import 'package:bunny_ngim_app/model/response/language_model.dart';
import 'package:bunny_ngim_app/util/images.dart';

class AppConstants {
  static const String BaseUrl = "https://airlyo.com/";
  static const String GET_CONFIG = "/api/v1/config";
  static const String APP_VERSION = '1.0.0';
  static const String USER_ID = 'userId';
  static const String GET_USER_INFO = '/api/v1/profile';
  static const String NAME = 'PFK';
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String MAP_KEY = '/data';
  static const String MAP_URL = '/data';
  static const String NOTIFICATION = '/data';
  static const String zoneTopic = '/data';
  static const String TOKEN_URI = '/data';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String PROFILE_URI = '/api/v1/profile';
  static const String USER_COUNTRY_CODE = '/data';
  static const String CHECK_PHONE_URI = '/data';
  static const String USER_NUMBER = '/data';
  static const String USER_PASSWORD = '/data';
  static const String USER_ADDRESS = '/data';
  static const String countryCode = '/data';
  static const String PHONE_URI = '/api/v1/auth/phone/login';
  static const String configUri = "frontend/pfk/pfk/";

  static const String abaStorePurchase =
      "https://eocontent.com/api/v1/store-aba";
  static const String abaStorePlanPurchase = "/api/v1/store-aba";
  static const String abaStorePurchaseUri = "/api/v1/store-aba";
  static const String abaCheckTransaction =
      "https://beautykh.eocambo.dev/api/v1/AbaCheckTransaction";

  static const String ABOUT_US = '/api/v1/config';
  static const String CATEGORY = '/api/v1/category';
  static const String TEMPLATE = '/api/v1/template?category_id=';
  static const String GET_PLAN = '/api/v1/plan';
  static const String GET_PROFILE = '/api/v1/profile';
  static const String CURRENT_PLAN = '/api/v1/billing/current-plan';
  static const String GET_INVOICE = '/api/v1/billing/invoice-history';
  static const String PROFILE_UPDATE = '/api/v1/profile/update';
  static const String SUBSCRIBE_PLAN = '/api/v1/store-plan';
  static const String GENERATE = '/api/v1/documents/app-generate';
  static const String DELETE_HISTORY = '/api/v1/delete-history';
  static const String RENAME_HISTORY = '/api/v1/rename-history';
  static const String DOCUMENT_GROUP = '/api/v1/create_document_group';
  static const String SOCIAL_LOGIN_URI = '/api/v1/auth/google';
  static const String GET_DOCUMENT = '/api/v1/documents/tools';
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
      imageUrl: Images.abapay,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.abapay,
      languageName: 'ភាសាខ្មែរ',
      countryCode: 'KH',
      languageCode: 'km',
    ),
    LanguageModel(
      imageUrl: Images.abapay,
      languageName: '中文',
      countryCode: 'CN',
      languageCode: 'zh',
    ),
  ];
}
