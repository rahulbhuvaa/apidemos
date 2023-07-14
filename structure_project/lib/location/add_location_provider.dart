// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';


// class LocationProvider extends ChangeNotifier {
//   bool isLoading = false;

//   // bool checkboxListTileValue = false;
//   // LoginResponse profileResponse = LoginResponse();

//   TextEditingController? cityController;
//   TextEditingController? stateController;
//   TextEditingController? countryController;
//   TextEditingController? address1Controller;
//   TextEditingController? address2Controller;

//   UserResponse userResponse = UserResponse();
//   ListUserLocation listUserLocation = ListUserLocation();
//   addLocationResponse({
//     required BuildContext context,
//     double? lat,
//     double? lng,
//     // String? addressLine1,
//     // String? addressLine2,
//     // String? city,
//     // String? state,
//     // String? country,
//   }) async {
//     isLoading = true;
//     notifyListeners();

//     try {
//       final user = SharedPrefrenceUtils.getObjectValue();

//       debugPrint("****   &&&&&   address  ..${user!.currentLat}");
//       Map<String, dynamic> body = {
//         "lat": lat.toString(),
//         "lng": lng.toString(),
//         "address_line_1": address1Controller!.text,
//         "address_line_2": address2Controller!.text,
//         "city": cityController!.text,
//         "state": stateController!.text,
//         "country": countryController!.text
//       };

//       APIResponse apiResponse = await APIManager.callAPI(context: context, url: UrlUtils.updateLocation, type: APIMethodType.POST, apiBodyType: APIBodyType.FORM_DATA, body: body);

//       debugPrint("++++++++${apiResponse.success}");

//       if (apiResponse.success) {
//         UpdateLocationResponce updateLocationResponce = UpdateLocationResponce.fromJson(apiResponse.response!);

//         if (updateLocationResponce.statuscode == 200 || updateLocationResponce.statuscode == 201) {
//           debugPrint("++++++++++L O C A T I O N ${address1Controller!.text}++++++++++++");
//           SharedPrefrenceUtils.setUserObject(PrefsKeyUtils.currentUser, updateLocationResponce.user!);

//           Navigator.of(context).pop();
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
//           );
//         } else {
//           CustomToast(msg: "Please submit all fields").SuccessToast();
//         }
//         return updateLocationResponce;
//       } else {
//         return null;
//       }
//       // isLoading = false;
//       // notifyListeners();
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     notifyListeners();
//     return null;
//   }

//   Future<ListUserLocation?> listLocation(BuildContext context) async {
//     try {
//       final user = SharedPrefrenceUtils.getObjectValue()!.village;
//       Map<String, dynamic> body = {
//         "village_id": user.toString(),
//       };

//       await APIManager.callAPI(context: context, url: UrlUtils.listLocation, type: APIMethodType.GET, body: body).then((apiResponse) {
//         debugPrint(" ======${apiResponse.success}+++++");
//         if (apiResponse.success) {
//           listUserLocation = ListUserLocation.fromJson(jsonDecode(jsonEncode(apiResponse.response)));
//           return listUserLocation;
//         } else {
//           return null;
//         }
//       });

//       // isLoading = false;
//       // notifyListeners();
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     notifyListeners();
//     return null;
//   }

//   EditProfileDetilsModel editProfileDetilsModel = EditProfileDetilsModel();
//   getIntialUserDeatils({BuildContext? context, int? userId}) async {
//     try {
//       Map<String, dynamic> body = {
//         "user_id": userId.toString(),
//       };

//       APIResponse apiResponse = await APIManager.callAPI(
//         context: context,
//         url: UrlUtils.currentUserDeatils,
//         type: APIMethodType.GET,
//         body: body,
//       );

//       //debugPrint('==========****************===========********=============');

//       if (apiResponse.success) {
//         editProfileDetilsModel = EditProfileDetilsModel.fromJson(apiResponse.response!);

//         notifyListeners();
//         return editProfileDetilsModel;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     // iscircular = false;
//     notifyListeners();
//   }
// }
