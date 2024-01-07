import 'package:awesome_notification_app/widgets/notification_button.dart';
import 'package:awesome_notification_app/services/notification_services.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Awesome Notification'),
          backgroundColor: Colors.cyan.shade900,
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.amberAccent.shade100,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NotificationButton(
                    text: 'Normal Notification',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                          title: 'Normal Notification Title', body: 'hi');
                    }),
                NotificationButton(
                    text: 'Notification With Summary',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                        title: 'Notification With Summary Title',
                        body: 'Notification With Summary ',
                        summary: 'Small Summary',
                      );
                    }),
                NotificationButton(
                    text: 'Progress Bar Notification',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                          title: 'Progress Bar Notification Title',
                          body: 'Progress Bar Notification',
                          notificationLayout: NotificationLayout.ProgressBar);
                    }),
                NotificationButton(
                    text: 'Big Picture Notification',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                          title: 'Big Picture Notification Title',
                          body: 'Big Picture Notification',
                          notificationLayout: NotificationLayout.BigPicture,
                          bigPicture: "https://i.imgur.com/2O33zPt.jpg");
                    }),
                NotificationButton(
                    text: 'Action Buttons Notification',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                          title: 'Action Buttons Notification Title',
                          body: 'Action Buttons Notification',
                          actionButtons: [
                            NotificationActionButton(
                                key: 'action_btn', label: 'Action Button')
                          ]);
                    }),
                NotificationButton(
                    text: 'Schedule Notification',
                    onPresed: () async {
                      await NotificationServices.showNotification(
                          title: 'Schedule Notification Title',
                          body: 'Schedule Notification 10 Seconds',
                          schedule: true,
                          date:
                              DateTime.now().add(const Duration(seconds: 10)));
                    }),
              ]),
        ));
  }
}
