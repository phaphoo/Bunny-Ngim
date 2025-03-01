import 'package:bunny_ngim_app/config/localization_controller.dart';
import 'package:bunny_ngim_app/theme/light_theme.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:bunny_ngim_app/util/messages.dart';
import 'package:bunny_ngim_app/view/base/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bunny_ngim_app/helper/get_di.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'helper/notification_helper copy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

  Map<String, Map<String, String>> _languages = await di.init();
  await GetStorage.init();
  Get.find<LocalizationController>().loadCurrentLanguage();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  MyNotification.initialize(flutterLocalNotificationsPlugin);
  runApp(MyApp(languages: _languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? mtoken;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (kocalization) {
        return GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild!.unfocus();
            }
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: light(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child!,
              );
            },
            translations: Messages(languages: widget.languages),
            fallbackLocale: Locale(
              AppConstants.languages[0].languageCode!,
              AppConstants.languages[0].countryCode,
            ),

            // supportedLocales: [
            //   Locale(AppConstants.languages[0].languageCode!),
            //   Locale(AppConstants.languages[1].languageCode!),
            // ],
            home: const SplashScreen(),
            locale: kocalization.locale,
          ),
        );
      },
    );
  }
}
