import 'package:flutter/material.dart';
import 'package:weather/core/dio_helper.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void navigate({required Widget toPage}) {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => toPage,
    ),
  );
}



void showMessage(
    {required String message, MessageType type = MessageType.failed}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Center(
          child: Text(
        message,
      )),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: type == MessageType.success
          ? Theme.of(navigatorKey.currentContext!).primaryColor
          : Colors.red,
    ),
  );
}
