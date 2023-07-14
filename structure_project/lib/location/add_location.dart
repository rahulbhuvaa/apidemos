// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:permission_handler/permission_handler.dart';

// class AddMyLocation extends StatefulWidget {
//   String? lattitude;
//   String? longitude;
//   AddMyLocation({Key? key, this.lattitude, this.longitude}) : super(key: key);

//   @override
//   State<AddMyLocation> createState() => _AddMyLocationState();
// }

// class _AddMyLocationState extends State<AddMyLocation> {
//   // LocationData? currentLocation = LocationData.fromMap({});

//   // LocationVariable.Location? location;
//   Position? _currentPosition;
//   String? _currentAddress;
//   GoogleMapController? _mapController;
//   LatLng? destinationLatlng;

//   CameraPosition? cameraPosition;
//   CameraPosition? cameraIdel;

//   String? _placemark;
//   Placemark? place;

//   @override
//   void initState() {
//     setInitialLocation();
//     // location = LocationVariable.Location();

//     if ((widget.lattitude == null && widget.longitude == null) || (widget.lattitude == "" && widget.longitude == "")) {
//     } else {
//       debugPrint(widget.lattitude);
//       _getAddressFromLatLng(
//         Position(latitude: double.parse(widget.lattitude!), longitude: double.parse(widget.longitude!), timestamp: null, accuracy: 0.0, altitude: 0.0, heading: 0.0, speed: 0.0, speedAccuracy: 0.0),
//       );
//       cameraPosition = CameraPosition(
//           zoom: 20,
//           // tilt: 80,
//           target: LatLng(double.parse(widget.lattitude!), double.parse(widget.longitude!)));

     
//     }

//     super.initState();
//   }

//   setInitialLocation() async {
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
//       debugPrint("L O C A T I O N ......${position}");
//       cameraPosition = CameraPosition(
//           zoom: 20,
//           // tilt: 80,
//           target: LatLng(position.latitude, position.longitude));
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       log("M A P ${e}");
//     });
//     // if (mounted) {
//     //   setState(() {});
//     // }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
//       _mapController!.animateCamera(CameraUpdate.newCameraPosition(
//         cameraPosition = CameraPosition(
//           // bearing: 270.0,
//           target: LatLng(double.parse(widget.lattitude!), double.parse(widget.longitude!)),
//           // tilt: 30.0,
//           zoom: 10.0,
//         ),
//       ));
//     });
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(position.latitude, position.longitude).then((List<Placemark> placeMarks) {
//       place = placeMarks[0];
//       setState(() {
//         _placemark = "${place?.street}, ${place?.name}, ${place?.locality},${place?.administrativeArea},${place?.country}";
//         log('NAME $_placemark');
//         // '${place!.locality ?? ''}, ${place!.administrativeArea}, ${place!.country},${place!.street}';
//       });
//     }).catchError((e) {
//       // debugPrint(e);
//     });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double mapWidth = MediaQuery.of(context).size.width;
//     double mapHeight = MediaQuery.of(context).size.height - 215;
//     double iconSize = 40.0;
//     return WillPopScope(
//       onWillPop: () async {
//         unawaited(
//           Navigator.of(context, rootNavigator: true).push(
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => WillPopScope(
//                 onWillPop: () async => false,
//                 child: const Scaffold(
//                   backgroundColor: Colors.transparent,
//                   body: Center(
//                     child: CircularProgressIndicator(strokeWidth: 1),
//                   ),
//                 ),
//               ),
//               transitionDuration: Duration.zero,
//               barrierDismissible: false,
//               barrierColor: Colors.black45,
//               opaque: false,
//             ),
//           ),
//         );
//         await Future.delayed(const Duration(seconds: 2));
//         Navigator.of(context)
//           ..pop()
//           ..pop();
//         return true;
//       },
//       child: ScaffoldBackground(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: transparent,
//             elevation: 0,
//             title: CustomHeader(
//               title: LocaleKeys.fetchLocation.tr,
//             ),
//             centerTitle: false,
//             leading: GestureDetector(
//                 onTap: () async {
//                   unawaited(
//                     Navigator.of(context, rootNavigator: true).push(
//                       PageRouteBuilder(
//                         pageBuilder: (_, __, ___) => WillPopScope(
//                           onWillPop: () async => false,
//                           child: const Scaffold(
//                             backgroundColor: Colors.transparent,
//                             body: Center(
//                               child: CircularProgressIndicator(strokeWidth: 1),
//                             ),
//                           ),
//                         ),
//                         transitionDuration: Duration.zero,
//                         barrierDismissible: false,
//                         barrierColor: Colors.black45,
//                         opaque: false,
//                       ),
//                     ),
//                   );
//                   await Future.delayed(const Duration(seconds: 2));
//                   Navigator.of(context)
//                     ..pop()
//                     ..pop();
//                 },
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: buttonColor,
//                 )),
//           ),
//           backgroundColor: transparent,
//           body: Stack(
//             children: [
//               // GoogleMap(
//               //   initialCameraPosition: _kInitialPosition,
//               //   onMapCreated: _onMapCreated,
//               //   onCameraMove: (position) {},
//               // ),
//               cameraPosition != null
//                   ? GoogleMap(
//                       onMapCreated: _onMapCreated,
//                       zoomGesturesEnabled: true,
//                       zoomControlsEnabled: false,
//                       initialCameraPosition: cameraPosition!,
//                       myLocationEnabled: true,
//                       myLocationButtonEnabled: false,
//                       onCameraMove: (CameraPosition cameraPositiona) {
//                         cameraPosition = cameraPositiona;
//                         // setState(() {});
//                       },
//                       onCameraIdle: () {
//                         cameraIdel = cameraPosition;
//                         _getAddressFromLatLng(
//                           Position(
//                               latitude: cameraIdel!.target.latitude,
//                               longitude: cameraIdel!.target.longitude,
//                               timestamp: null,
//                               accuracy: 0.0,
//                               altitude: 0.0,
//                               heading: 0.0,
//                               speed: 0.0,
//                               speedAccuracy: 0.0),
//                         );
//                         setState(() {});
//                         // debugPrint('heyyyy.....${cameraIdel!.target.latitude}');
//                       },
//                     )
//                   : const Center(child: CircularProgressIndicator()),
//               Visibility(
//                 visible: cameraPosition == null ? false : true,
//                 child: Positioned(
//                   top: (mapHeight - iconSize) / 2,
//                   right: (mapWidth - iconSize) / 2,
//                   child: Icon(Icons.location_pin, color: buttonColor, size: iconSize),
//                   // child: Image.asset('assets/location.png', fit: BoxFit.cover),
//                 ),
//               ),
//             ],
//           ),
//           bottomNavigationBar:
//               //  place?.locality == null || place?.locality == ""
//               _placemark == null || _placemark == ''
//                   ? const SizedBox()
//                   : Padding(
//                     padding:  EdgeInsets.all(15),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           LocaleKeys.selectedAddress.tr,
//                           // textAlign: TextAlign.start,
//                           style: FontUtilities.h18(fontColor: buttonColor, fontWeight: FWT.semiBold),
//                         ),
//                         // const SizedBox(
//                         // height: 8,
//                         // ),
//                         Text(
//                           // place?.locality == null || place?.locality == ""
//                           _placemark == null || _placemark == ''
//                               ? ''
//                               : place?.locality == null || place?.locality == ""
//                                   ? "${place?.administrativeArea}, ${place?.country}"
//                                   : '${place?.locality}, ${place?.administrativeArea}, ${place?.country}',
//                           style: TextStyle(
//                             color: black,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 18,
//                             fontFamily: 'Poppins',
//                             fontStyle: FontStyle.normal,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         // const Spacer(),
//                         CustomTextButton(
//                           onPressed: () async {
//                             await SharedPrefrenceUtils.setStringValue(
//                               PrefsKeyUtils.lattitudeKey,
//                               '${cameraPosition!.target.latitude}',
//                             );
//                             await SharedPrefrenceUtils.setStringValue(PrefsKeyUtils.longitudeKey, '${cameraPosition!.target.longitude}');
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => CurrentLoation(
//                                         lattitude: cameraPosition!.target.latitude,
//                                         longitude: cameraPosition!.target.longitude,
//                                       )),
//                             );
//                             // Navigator.of(context).pop();
//                           },
//                           labelText: LocaleKeys.next.tr,
//                           height: 50,
//                         ),
                      
//                       ],
//                     ),
//                   ),
//         ),
//       ),
//     );
//   }
// }
