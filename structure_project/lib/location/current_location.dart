// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:provider/provider.dart';
// import 'package:structure_project/location/add_location_provider.dart';

// class CurrentLoation extends StatefulWidget {
//   double? lattitude;
//   double? longitude;
//   final String? address1;
//   final String? address2;
//   final String? city;
//   final String? state;
//   final String? country;

//   CurrentLoation(
//       {Key? key,
//       this.lattitude,
//       this.longitude,
//       this.address1,
//       this.address2,
//       this.city,
//       this.state,
//       this.country})
//       : super(key: key);

//   @override
//   State<CurrentLoation> createState() => _LocationInputFeildState();
// }

// class _LocationInputFeildState extends State<CurrentLoation> {
//   String? _placemark;
//   Placemark? place;
//   LocationProvider? locationProvider;
//   // EditProfileProvider? editProfileProvider = EditProfileProvider();
//   // UserResponse? user;

//   String? lat;
//   String? lng;

//   @override
//   void initState() {
//     user = SharedPrefrenceUtils.getObjectValue();

//     lat = SharedPrefrenceUtils.getStringValue(
//       PrefsKeyUtils.lattitudeKey,
//     );
//     lng = SharedPrefrenceUtils.getStringValue(
//       PrefsKeyUtils.longitudeKey,
//     );

    

//     locationProvider = Provider.of<LocationProvider>(context, listen: false);
//     (widget.city == null || user!.currentCity == null) &&
//             (widget.country == null || user!.currentCountry == null)
//         ? _getAddressFromLatLng(
//             Position(
//                 latitude: user!.currentLat!,
//                 longitude: user!.currentLng!,
//                 // latitude: widget.lattitude!,
//                 // longitude: widget.longitude!,
//                 timestamp: null,
//                 accuracy: 0.0,
//                 altitude: 0.0,
//                 heading: 0.0,
//                 speed: 0.0,
//                 speedAccuracy: 0.0),
//           )
//         : null;


//     super.initState();
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(widget.lattitude ?? user!.currentLat!,
//             widget.longitude ?? user!.currentLng!)
//         .then((List<Placemark> placemarks) {
//       place = placemarks[0];
//       setState(() {
//         _placemark =
//             '${place!.locality}, ${place!.administrativeArea}, ${place!.country}';

//         log("......${_placemark}");
//       });

   

//       locationProvider!.cityController =
//           TextEditingController(text: place!.locality);
//       locationProvider!.stateController =
//           TextEditingController(text: place!.administrativeArea);
//       locationProvider!.countryController =
//           TextEditingController(text: place!.country);
//       locationProvider!.address1Controller = TextEditingController(text: "");
//       locationProvider!.address2Controller = TextEditingController(text: "");
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, LocationProvider provider, child) {
//       debugPrint("======== l a t ........ ${lat}");
//       return ScaffoldBackground(
//           child: GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           //resizeToAvoidBottomInset: true,
//           backgroundColor: transparent,
//           appBar: AppBar(
//             elevation: 0,
//             title: Text(
//               LocaleKeys.currentAddress.tr,
//               style: TextStyle(color: textColor),
//             ),
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back_sharp,
//                 color: buttonColor,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             backgroundColor: transparent,
//           ),
//           body: SafeArea(
//             child: Padding(
//               //  padding: mainPadding,
//               padding: const EdgeInsets.all(15),
//               child: SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 child: SlideFadeInAnimation(
//                   offset: const Offset(0, 100),
//                   curve: Curves.decelerate,
//                   duration: const Duration(milliseconds: 500),
//                   delay: const Duration(milliseconds: 500),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomTextField(
//                         controller: provider.address1Controller,
//                         keyboardtype: TextInputType.name,
//                         textInputAction: TextInputAction.next,
//                         lableText: LocaleKeys.addressLine1.tr,
//                         hinttext: LocaleKeys.addressLine1.tr,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         controller: provider.address2Controller,
//                         textInputAction: TextInputAction.next,
//                         keyboardtype: TextInputType.name,
//                         lableText: LocaleKeys.addressLine2.tr,
//                         hinttext: LocaleKeys.addressLine2.tr,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         readonly: true,
//                         textInputAction: TextInputAction.next,
//                         keyboardtype: TextInputType.name,
//                         controller: provider.cityController,
//                         lableText: LocaleKeys.city.tr,
//                         hinttext: LocaleKeys.city.tr,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         readonly: true,
//                         controller: provider.stateController,
//                         textInputAction: TextInputAction.next,
//                         keyboardtype: TextInputType.name,
//                         lableText: LocaleKeys.state.tr,
//                         hinttext: LocaleKeys.state.tr,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomTextField(
//                         readonly: true,
//                         controller: provider.countryController,
//                         keyboardtype: TextInputType.name,
//                         lableText: LocaleKeys.country.tr,
//                         hinttext: LocaleKeys.country.tr,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           bottomNavigationBar: Padding(
//             padding: const EdgeInsets.all(20),
//             child: CustomTextButton(
//               labelText: LocaleKeys.save.tr,
//               onPressed: () async {
//                 await provider.addLocationResponse(
//                   context: context,
//                   // lat: user!.currentLat!,
//                   // lng: user!.currentLng!,
//                   lat: double.parse(lat!),
//                   lng: double.parse(lng!),
//                 );
               
//               },
//             ),
//           ),
//         ),
//       ));
//     });
//   }
// }
