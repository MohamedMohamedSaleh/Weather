import 'package:flutter/material.dart';
import 'package:weather/core/dio_helper.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showMessage({required String message,  MessageType type = MessageType.failed}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Center(child: Text(message,)),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == MessageType.success? Theme.of(navigatorKey.currentContext!).primaryColor: Colors.red,
    ),
  );
}
