// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:structure_project/utils/app_text_style.dart';

class NoInternetException implements Exception {
  showNoNetworkWidget({
    required BuildContext context,
    required VoidCallback onCancelTap,
    required VoidCallback onRetryTap,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text("noInternetTitle"),
          content: Text("noInternetMsg", style: size14()),
          actions: [
            // ignore: deprecated_member_use
            MaterialButton(onPressed: onCancelTap, child: const Text("cancelText")),
            // ignore: deprecated_member_use
            MaterialButton(onPressed: onRetryTap, child: const Text("Retry")),
          ],
        );
      },
    );
  }
}
