import 'dart:developer';

import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalUtilsCheck {
  checkPermission() {
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {});
  }

  ///for get device token
  Future<String> getDeviceDetails() async {
    final status = await OneSignal.shared.getDeviceState();
    final String osUserID = status!.userId ?? "";
    log("jsonRepresentation -> ${status.jsonRepresentation()}");
    return osUserID; //player id
  }
}class OneSignalUtils {
  static const String appId = '0be2eb76-a586-43f9-ae90-edac34232158';
}
