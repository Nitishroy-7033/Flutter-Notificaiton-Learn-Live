import 'package:awesome_notifications/awesome_notifications.dart';
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
        body: "This is Picture notification new message from flutter hero team.",
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: "asset://assets/image.png",
        actionType: ActionType.Default,
      ),
    );
  }
}
