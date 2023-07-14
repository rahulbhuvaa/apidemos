// // ignore_for_file: use_build_context_synchronously

// import 'dart:async';
// import 'dart:developer';

// import 'dart:ui';
// import 'dart:ui' as ui;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:lottie/lottie.dart';

// import 'package:provider/provider.dart';
// import 'package:structure_project/location/add_location_provider.dart';
// import 'package:structure_project/utils/base_color.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   @override
//   State<LocationScreen> createState() => _AddMyLocationScreenState();
// }

// class _AddMyLocationScreenState extends State<LocationScreen> {
//   // LocationData? currentLocation = LocationData.fromMap({});
//   Position? _currentPosition;
//   String? _currentAddress;
//   // Location? location;
//   // Uint8List? imageData;

//   final Set<Marker> markers = Set();

//   GoogleMapController? _mapController;
//   LatLng? destinationLatlng;
//   CameraPosition? cameraPosition = const CameraPosition(
//     bearing: 270.0,
//     target: LatLng(21.170240, 72.831062),
//     // tilt: 30.0,
//     zoom: 17.0,
//   );

//   CameraPosition? cameraIdel;
//   LocationProvider locationProvider = LocationProvider();
//   BitmapDescriptor? pinLocationIcon;
//   @override
//   void initState() {
//     // location = Location();
//     // setMarker();
//     // setCustomMapPin();

//     locationProvider = Provider.of<LocationProvider>(context, listen: false);
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       await locationProvider.listLocation(context);
//     });
//     getMarkers();
//     setInitialLocation();
//     super.initState();
//   }

//   // Future<Uint8List> getMarker() async {
//   //   ByteData byteData = await DefaultAssetBundle.of(context).load('assets/marker.png');
//   //   return byteData.buffer.asUint8List();
//   // }

//   // setMarker() async {
//   //   imageData = await getMarker();
//   //   if (mounted) {
//   //     setState(() {});
//   //   }
//   //   //  debugPrint('IMAGEIMAGEIMAGE:$imageData');
//   // }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;

//       _mapController!.animateCamera(CameraUpdate.newCameraPosition(
//         cameraPosition = const CameraPosition(
//           //   bearing: 270.0,
//           target: LatLng(21.170240, 72.831062),
//           // tilt: 30.0,
//           zoom: 8.0,
//           //zoom: 4.0,
//         ),
//       ));
//     });
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(_currentPosition!.latitude, _currentPosition!.longitude).then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//         debugPrint("Location <><><><><><><> $_currentAddress");
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
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
//       debugPrint("LOCATION MAP $e");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
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
//       child:  Scaffold(
//           appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               centerTitle: false,
//               title: const Text(
//                " LocaleKeys.location.tr",
//                 style: TextStyle(color: Colors.black),
//               ),
//               leading: GestureDetector(
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
//                 child: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.amber,
//                 ),
//               )),
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               GoogleMap(
//                 onMapCreated: _onMapCreated,
//                 zoomGesturesEnabled: true,
//                 zoomControlsEnabled: false,
//                 initialCameraPosition: cameraPosition!,
//                 myLocationEnabled: true,
//                 myLocationButtonEnabled: true,
//                 // markers: Set<Marker>.of(markers),
//                 markers: markers,
//                 onCameraMove: (CameraPosition cameraPositiona) {
//                   cameraPosition = cameraPositiona;
//                   // setState(() {});
//                 },
//                 onCameraIdle: () {
//                   setState(() {
//                     cameraIdel = cameraPosition;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
      
//     );
//   }

//   // final List<LatLng> _latLang = [
//   //   // const LatLng(locationProvider.listUserLocation.data[0], 72.831062), //surat
//   //   // const LatLng(27.391277, 73.432617), //rajsthan
//   //   // const LatLng(21.146633, 79.088860), //nagpur
//   //   // const LatLng(19.076090, 72.877426), //mumbai
//   //   // const LatLng(12.972442, 77.580643), //bangluru
//   //   const LatLng(21.170240, 72.831062), //surat
//   //   const LatLng(27.391277, 73.432617), //rajsthan
//   //   const LatLng(21.146633, 79.088860), //nagpur
//   //   const LatLng(19.076090, 72.877426), //mumbai
//   //   const LatLng(12.972442, 77.580643), //bangluru
//   // ];

//   // Future<Uint8List> getImages(String path, int width) async {
//   //   ByteData data = await rootBundle.load(path);
//   //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
//   //   ui.FrameInfo fi = await codec.getNextFrame();
//   //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//   // }

//   getMarkers() async {
//     BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(),
//       "assets/marker.png",
//     );
//     setState(() {
//       int dataLength = locationProvider.listUserLocation.data == null ? 0 : locationProvider.listUserLocation.data!.length;
//       // log("DATA LENGTH $dataLength");
//       // log("DATA LENGTH ====== ${locationProvider.listUserLocation.data!.length}");
//       for (int i = 0; i < dataLength; i++) {
//         LatLng index = LatLng(locationProvider.listUserLocation.data![i].lat!, locationProvider.listUserLocation.data![i].lng!);

//         markers.add(Marker(
//             markerId: MarkerId(i.toString()),
//             position: index,
//             onTap: () async {
//               await locationProvider.getIntialUserDeatils(context: context, userId: locationProvider.listUserLocation.data![i].userId);
//               // debugPrint(
//               //     'current lat lng ......${currentLocation!.latitude}, ${currentLocation!.longitude}');
//               // debugPrint(
//               //     'index lat lng ......${index.latitude}, ${index.longitude}');

//               showModalBottomSheet(
//                 //  isDismissible: false,
//                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//                 context: context,
//                 builder: (context) {
//                   return Container(
//                     //  padding: const EdgeInsets.only(top: 20),
//                     decoration: const BoxDecoration(
//                       // color: Colors.black26,
//                       borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//                     ),
//                     // height: 280,
//                     // height: MediaQuery.of(context).size.height * 0.32,
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Center(
//                           child: FractionallySizedBox(
//                             widthFactor: 0.23,
//                             child: Container(
//                               margin: const EdgeInsets.symmetric(
//                                 vertical: 15.0,
//                               ),
//                               child: Container(
//                                 height: 4.0,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[300],
//                                   borderRadius: const BorderRadius.all(Radius.circular(50)),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                             leading: Container(
//                                 alignment: Alignment.center,
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   shape: locationProvider.editProfileDetilsModel.user!.profilePicture == "http://devmarugam.encodework.com/profile_pictures/default.png"
//                                       ? BoxShape.circle
//                                       : BoxShape.rectangle,
//                                   // borderRadius: BorderRadius.circular(15)
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Image.network(
//                                     locationProvider.editProfileDetilsModel.user!.profilePicture!,
//                                     height: 50,
//                                     width: 50,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 )),
//                             title: Text(locationProvider.editProfileDetilsModel.user!.name!),
//                             subtitle: const Text('Family Head'),
//                             trailing: locationProvider.editProfileDetilsModel.user!.mobile == "" || locationProvider.editProfileDetilsModel.user!.mobile == null
//                                 ? const SizedBox()
//                                 : GestureDetector(
//                                     onTap: () {
//                                       UrlLauncher.launchUrl(
//                                         Uri.parse('tel:+91 ${locationProvider.editProfileDetilsModel.user!.mobile}'),
//                                       );
//                                       // debugPrint("=======   M O B I L E  ${locationProvider!.editProfileDetilsModel.user!.mobile}");
//                                     },
//                                     child: SvgPicture.asset(
//                                       "call",
//                                       height: 25,
//                                       color: Colors.red,
//                                     ),
//                                   )),
//                         locationProvider.editProfileDetilsModel.user!.currentCity == null || locationProvider.editProfileDetilsModel.user!.currentCity == ""
//                             ? const SizedBox()
//                             : Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 20,
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(right: 15),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             '${locationProvider.editProfileDetilsModel.user!.currentCity}, ${locationProvider.editProfileDetilsModel.user!.currentState}, ${locationProvider.editProfileDetilsModel.user!.currentCountry}',
//                                             style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 16),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () async {
//                                               // debugPrint(
//                                               //     'current lat lng ......${currentLocation!.latitude}, ${currentLocation!.longitude}');
//                                               debugPrint('index lat lng ......${index.latitude}, ${index.longitude}');
//                                               String url = 'https://www.google.com/maps?daddr=${index.latitude},${index.longitude}&dir_action=navigate';
//                                               if (await canLaunch(url)) {
//                                                 await launch(url);
//                                               } else {
//                                                 throw 'Could not launch $url';
//                                               }
//                                             },
//                                             child: SvgPicture.asset(
//                                               "sharemap",
//                                               height: 20,
                                            
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(height: 15),
//                                     const Row(
//                                       children: [
//                                         Text(
//                                           'Business:',
//                                           style: TextStyle(color: blackColor, fontWeight: FontWeight.bold, fontSize: 12),
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(left: 8),
//                                           child: Text(
//                                             'XYZ Business',
//                                             style: TextStyle(color: blackColor, fontSize: 12),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 15),
//                                     Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           child: const Align(
//                                             alignment: Alignment.topLeft,
//                                             child: Text(
//                                               'Address:',
//                                               style: TextStyle(color: blackColor, fontWeight: FontWeight.bold, fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 10),
//                                           child: Container(
//                                             width: MediaQuery.of(context).size.width / 1.5,
//                                             // constraints: BoxConstraints(maxWidth: 100),
//                                             child: Text(
//                                               locationProvider.editProfileDetilsModel.user!.currentAddressLine1! +
//                                                   ", " +
//                                                   locationProvider.editProfileDetilsModel.user!.currentAddressLine2! +
//                                                   ", " +
//                                                   locationProvider.editProfileDetilsModel.user!.currentCity! +
//                                                   ", " +
//                                                   locationProvider.editProfileDetilsModel.user!.currentState! +
//                                                   ", " +
//                                                   locationProvider.editProfileDetilsModel.user!.currentCountry!,
//                                               style: TextStyle(color: blackColor, fontSize: 12),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 10)
//                                   ],
//                                 ),
//                               )
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             icon: markerbitmap));
//       }
//     });
//   }
// }
