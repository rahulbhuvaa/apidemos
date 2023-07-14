part of fancy_snackbar;

/// these are the snackbar types we are providing.
enum FancySnackBarType {
  success,
  error,
  info,
  warning,
  waiting,
}

/// this function is returning the default title based on the snackbar type.
String getSnackbarTitle(FancySnackBarType type) {
  switch (type) {
    case FancySnackBarType.error:
      return "Oh snap!";
    case FancySnackBarType.info:
      return "Hi there!";
    case FancySnackBarType.success:
      return "Well done!";
    case FancySnackBarType.waiting:
      return "Waiting!";
    case FancySnackBarType.warning:
      return "Warning!";
  }
}

/// this function is returning default message based on the snackbar type.
String getSnackbarMessage(FancySnackBarType type) {
  switch (type) {
    case FancySnackBarType.error:
      return "Change a few things up and try submitting again.";
    case FancySnackBarType.info:
      return "Do you have a problem? Just use the contact form.";
    case FancySnackBarType.success:
      return "You successfully read this important message.";
    case FancySnackBarType.waiting:
      return "Please wait for a moment while fetching data.";
    case FancySnackBarType.warning:
      return "Sorry! There was a problem with your request.";
  }
}

/// this function is returning the icon to show on snackbar based on the type of snackbar.
IconData getSnackbarIcon(FancySnackBarType type) {
  switch (type) {
    case FancySnackBarType.error:
      return CupertinoIcons.clear;
    case FancySnackBarType.info:
      return CupertinoIcons.question;
    case FancySnackBarType.success:
      return Icons.check;
    case FancySnackBarType.waiting:
      return CupertinoIcons.clock;
    case FancySnackBarType.warning:
      return CupertinoIcons.exclamationmark;
  }
}

/// this function returns the default color based on the snackbar type.
/// if you don't pass any color while using the snackbar then it takes default color automatically.
SnackBarColors getSnackbarDefaultColor(FancySnackBarType type) {
  switch (type) {
    case FancySnackBarType.error:
      return SnackBarColors.error1;
    case FancySnackBarType.info:
      return SnackBarColors.info1;
    case FancySnackBarType.success:
      return SnackBarColors.success1;
    case FancySnackBarType.waiting:
      return SnackBarColors.waitting1;
    case FancySnackBarType.warning:
      return SnackBarColors.waitting1;
  }
}

/// this is the method to return color based on the selected color from enum.
Color getSnackbarColor(SnackBarColors color) {
  switch (color) {
    case SnackBarColors.waitting1:
      return ColorUtilities.waitting1;


    case SnackBarColors.success1:
      return ColorUtilities.success1;


    case SnackBarColors.warning1:
      return ColorUtilities.warning1;
  

    case SnackBarColors.error1:
      return ColorUtilities.error1;


    case SnackBarColors.info1:
      return ColorUtilities.info1;
  
  }
}

// this is the color enum used for making color selection.
enum SnackBarColors {
  waitting1,

  success1,

  warning1,

  error1,

  info1

}

/// this is the list of available colors for this package.
class ColorUtilities {
  static Color success1 =  Colors.green.shade900;

  static Color warning1 = Colors.amber.shade900;

  static Color error1 = Colors.red.shade900;

  static Color waitting1 = Colors.amber.shade900;

  static Color info1 = Colors.blueAccent.shade700;

}
