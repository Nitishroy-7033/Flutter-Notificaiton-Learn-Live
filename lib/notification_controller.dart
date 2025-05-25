import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  void showNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: "🎉 Hello from Flutter hero",
        body: "This is new message from flutter hero team.",
        actionType: ActionType.Default,
      ),
    );
  }

  void showPictureNotification() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: "🎉 Hello from Flutter hero",
        body:
            "This is Picture notification new message from flutter hero team.",
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: "asset://assets/image.png",
        actionType: ActionType.Default,
      ),
    );
  }

  void scheduleNotification(TimeOfDay time) async {
    final now = DateTime.now();

    print("⏰schedule Time : Hours :${time.hour} | Minute : ${time.minute}");
    final DateTime scheduleDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    final localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: '⏰ Scheduled Notification',
        body:
            'This notification was scheduled for ${time.format(Get.context!)}',
        notificationLayout: NotificationLayout.Default,
        actionType: ActionType.Default,
      ),
      schedule: NotificationCalendar.fromDate(
        date: scheduleDateTime,
        preciseAlarm: true,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }
}
