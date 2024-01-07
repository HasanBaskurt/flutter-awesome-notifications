import 'package:awesome_notification_app/screens/home.dart';
import 'package:awesome_notification_app/services/notification_services.dart';

import 'package:flutter/material.dart';

void main() async {
  await NotificationServices.initializeNotification();
  runApp(const AwesomeNotificationApp());
}

class AwesomeNotificationApp extends StatelessWidget {
  const AwesomeNotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}
