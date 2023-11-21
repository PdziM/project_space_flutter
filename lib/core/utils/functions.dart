import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

void nPrint(value) {
  logger.d(value.toString());
}

void wPrint(value) {
  logger.w(value.toString());
}

DateTime now = DateTime.now();

dynamic showCustomSuccess(
    {required BuildContext context,
    required String message,
    Duration? duration}) async {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    icon: const Icon(Icons.check_circle, color: Colors.white),
    messageText: Text(message, style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.green,
  ).show(context).then((value) {
    // Navigator.pop(context);
  });
}

dynamic showCustomError(
    {required BuildContext context,
    required String message,
    Duration? duration}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.orange,
  ).show(context);
}

dynamic showCustomFail(
    {required BuildContext context,
    required String message,
    Duration? duration}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.red,
  ).show(context);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

final oCcy = NumberFormat.simpleCurrency(locale: 'pt_BR');

Color getColorByBrightness(BuildContext context, {bool? subColor}) {
  if (Theme.of(context).brightness == Brightness.dark) {
    if (subColor == true) {
      return Colors.white70;
    }
    return Colors.white;
  } else {
    if (subColor == true) {
      return Colors.black54;
    }
    return Colors.black;
  }
}

String getFirstName(String name) {
  if (name.contains(' ')) {
    return name.substring(0, name.indexOf(' ')).capitalize();
  }
  return name.capitalize();
}

bool isToday(DateTime date) {
  return (date.day == now.day &&
      date.month == now.month &&
      date.year == now.year);
}
