import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MyNotification {
  static Future<void> initialize(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  ) async {
    // var androidInitialize =
    //     const AndroidInitializationSettings('notification_icon');
    var initializationSettingsAndroid = new AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    //var iOSInitialize = const IOSInitializationSettings();
    var iOSInitialize = const DarwinInitializationSettings();

    var initializationsSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iOSInitialize,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      //onSelectNotification: (String? payload) async {
      onDidReceiveNotificationResponse: (
        NotificationResponse notificationResponse,
      ) async {
        try {
          if (notificationResponse.payload != null &&
              notificationResponse.payload!.isNotEmpty) {
            // Handle notification payload
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
          "onMessage: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}",
        );
      }
      showNotification(message, flutterLocalNotificationsPlugin, false);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
          "onOpenApp: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}",
        );
      }
      try {
        if (message.notification!.titleLocKey != null &&
            message.notification!.titleLocKey!.isNotEmpty) {
          // Handle notification click
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }

  static Future<void> showNotification(
    RemoteMessage message,
    FlutterLocalNotificationsPlugin fln,
    bool data,
  ) async {
    try {
      String? title;
      String? body;
      String? orderID;
      String? image;

      if (data) {
        title = message.data['title'];
        body = message.data['body'];
        orderID = message.data['order_id'];
        image =
            (message.data['image'] != null && message.data['image'].isNotEmpty)
                ? message.data['image'].startsWith('http')
                    ? message.data['image']
                    : '${AppConstants.BaseUrl}/storage/app/public/notification/${message.data['image']}'
                : null;
      } else {
        title = message.notification!.title;
        body = message.notification!.body;
        orderID = message.notification!.titleLocKey;
        if (Platform.isAndroid) {
          image =
              (message.notification!.android!.imageUrl != null &&
                      message.notification!.android!.imageUrl!.isNotEmpty)
                  ? message.notification!.android!.imageUrl!.startsWith('http')
                      ? message.notification!.android!.imageUrl
                      : '${AppConstants.BaseUrl}/storage/app/public/notification/${message.notification!.android!.imageUrl}'
                  : null;
        } else if (Platform.isIOS) {
          image =
              (message.notification!.apple!.imageUrl != null &&
                      message.notification!.apple!.imageUrl!.isNotEmpty)
                  ? message.notification!.apple!.imageUrl!.startsWith('http')
                      ? message.notification!.apple!.imageUrl
                      : '${AppConstants.BaseUrl}/storage/app/public/notification/${message.notification!.apple!.imageUrl}'
                  : null;
        }
      }

      if (image != null && image.isNotEmpty) {
        try {
          await showBigPictureNotificationHiddenLargeIcon(
            title,
            body,
            orderID,
            image,
            fln,
          );
        } catch (e) {
          await showBigTextNotification(title, body!, orderID, fln);
        }
      } else {
        await showBigTextNotification(title, body!, orderID, fln);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Failed to show notification: $e");
      }
    }
  }

  static Future<void> showBigTextNotification(
    String? title,
    String body,
    String? orderID,
    FlutterLocalNotificationsPlugin fln,
  ) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'dai-thom-ll',
          'dai-thom-ll',
          importance: Importance.max,
          styleInformation: bigTextStyleInformation,
          priority: Priority.max,
          playSound: true,
          sound: const RawResourceAndroidNotificationSound('notification.mp3'),
        );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<void> showBigPictureNotificationHiddenLargeIcon(
    String? title,
    String? body,
    String? orderID,
    String image,
    FlutterLocalNotificationsPlugin fln,
  ) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
      image,
      'bigPicture',
    );
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
          FilePathAndroidBitmap(bigPicturePath),
          hideExpandedLargeIcon: true,
          contentTitle: title,
          htmlFormatContentTitle: true,
          summaryText: body,
          htmlFormatSummaryText: true,
        );
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'dai-thom-ll',
          'dai-thom-ll',
          largeIcon: FilePathAndroidBitmap(largeIconPath),
          priority: Priority.max,
          styleInformation: bigPictureStyleInformation,
        );
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.show(0, title, body, platformChannelSpecifics, payload: orderID);
  }

  static Future<String> _downloadAndSaveFile(
    String url,
    String fileName,
  ) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(
      "onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}",
    );
  }
}
