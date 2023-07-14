
import 'package:permission_handler/permission_handler.dart';


Future<bool> checkLocationPermission() async {
    bool isHealthPermissionAccepted = false;

    bool checkHealth = await Permission.location.isGranted;

    List<Permission> permissions = [];

    if (!checkHealth) {
      permissions.add(Permission.location);
    }

    if (permissions.isNotEmpty) {
      Map<Permission, PermissionStatus> statuses = await permissions.request();

      if (statuses.containsValue(PermissionStatus.denied) || statuses.containsValue(PermissionStatus.permanentlyDenied)) {
        isHealthPermissionAccepted = false;
      } else {
        isHealthPermissionAccepted = true;
      }
    } else {
      isHealthPermissionAccepted = true;
    }

    return isHealthPermissionAccepted;
  }
   