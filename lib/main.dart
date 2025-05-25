import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification/home_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize("", [
    NotificationChannel(
      channelKey: "basic_channel",
      channelName: "Basic notification",
      channelDescription: "Notification channel for basix tests",
      defaultColor: Color(0xFF9D50DD),
      ledColor: Colors.white,
    ),
  ], debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FLutter Notification',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
