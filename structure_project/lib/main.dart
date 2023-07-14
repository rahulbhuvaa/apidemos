import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:structure_project/Pref/share_prefrence.dart';

Future<void> main() async {
  await PreferenceUtils().init();

  //not roated screen
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  
}