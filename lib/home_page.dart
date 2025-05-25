import 'package:flutter/material.dart';
import 'package:flutter_notification/notification_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = Get.put(
      NotificationController(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
        title: Text("NOTIFICATION"),
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Welcome"),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      notificationController.showNotification();
                    },
                    child: Text("Show Notification"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      notificationController.showPictureNotification();
                    },
                    child: Text("Show Picture Notification"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if(time!=null)
                      {
                        notificationController.scheduleNotification(time);
                      }
                    },
                    child: Text("Schedule Notification"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
