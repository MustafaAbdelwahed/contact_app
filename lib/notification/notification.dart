import 'package:firebase_messaging/firebase_messaging.dart';

class Notofication {
  static Future<void> initalizNotificationSetting() async {
    final notify = FirebaseMessaging.instance;
    await notify.requestPermission();
    final token = await notify.getToken();
    print("//////////////////////////////////////////////");
    print("token: $token");

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    print("title: ${message.notification?.title}");
    print("body: ${message.notification?.body}");
    // print("data: ${message.data}");
  }
}
