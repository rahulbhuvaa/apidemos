

import 'package:flutter/material.dart';


import 'package:structure_project/snackbar/custom_fancy_snackbar/fancy_snackbar.dart';

enum MotionToastType {
  success,
  warning,
  error,
  info,
}

motionToastWidget({
  required BuildContext? context,
  MotionToastType motionType = MotionToastType.error,
  String toastMsg = '',
}) {
  motionType == MotionToastType.error
      ? FancySnackbar.showSnackbar(
          context!,
          snackBarType: FancySnackBarType.error,
          title: "ERROR",
          message: toastMsg,
          duration: 3,
          onCloseEvent: () {},
        )
      : motionType == MotionToastType.warning
          ? FancySnackbar.showSnackbar(
              context!,
              snackBarType: FancySnackBarType.warning,
              title: "Warning",
              message: toastMsg,
              duration: 2,
              onCloseEvent: () {},
            )
          : motionType == MotionToastType.success
              ? FancySnackbar.showSnackbar(
                  context!,
                  snackBarType: FancySnackBarType.success,
                  title: "success",
                  message: toastMsg,
                  duration: 2,
                  onCloseEvent: () {},
                )
              : motionType == MotionToastType.info
                  ? FancySnackbar.showSnackbar(
                      context!,
                      snackBarType: FancySnackBarType.info,
                      title: "info",
                      message: toastMsg,
                      duration: 2,
                      onCloseEvent: () {},
                    )
                  : const SizedBox();
}
