import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton(
      {super.key, required this.text, required this.onPresed});
  final String text;
  final AsyncCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan.shade900,
        ),
        onPressed: onPresed,
        child: Text(text));
  }
}
