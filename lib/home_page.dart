// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bhs_app/menu.dart';
import 'package:bhs_app/notification_services.dart';
import 'package:bhs_app/theme.dart';
import 'package:bhs_app/theme_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'appbar.dart';
import 'explore.dart';
import 'nav_page.dart';
import 'theme_services.dart';
import 'package:get/get.dart';

import 'firebase_auth_methods.dart';

class Home2Page extends StatefulWidget {
  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  User user = FirebaseAuth.instance.currentUser!;

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
//   _appBar() {
//     return AppBar(
//       //backgroundColor: context.theme.backgroundColor,
//       elevation: 1,
//       leading:  GestureDetector(
//         onTap: () {
//           ThemeService().switchTheme();
//           notifyHelper.displayNotification(
//             titte:"Theme Changed",
//             body:Get.isDarkMode?"Activated Dark Theme":"Activated Light Theme",
//           );
//           toggleTheme();
//
//         },
//         child: Icon(isDarkTheme ?Icons.sunny:Icons.nightlight_round_outlined,
//           size: 22,
//           //color: Colors.black,
//         ),
//       ),
//
//         actions: [
//           Icon(Icons.settings),
//           SizedBox(width: 20,)
//         ]
//     );

}


