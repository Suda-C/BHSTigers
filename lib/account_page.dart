import 'package:bhs_app/auth_page.dart';
import 'package:bhs_app/bug_report.dart';
import 'package:bhs_app/login_page.dart';
import 'package:bhs_app/main.dart';
import 'package:bhs_app/sendfeedback_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'account_details.dart';
import 'firebase_auth_methods.dart';
import 'icon_widget.dart';

class AccountPage extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'GENERAL',
              children: <Widget>[
                buildDarkMode(),
              ],
            ),
            SizedBox(height: 32,),
            SettingsGroup(
              title: 'GENERAL',
              children: <Widget>[
                AccountDetailsPage(),
                buildLogout(context),
                buildDeleteAccount(context),
              ],
            ),
            SizedBox(height: 32,),
            SettingsGroup(
              title: 'FEEDBACK',
              children: <Widget>[
                buildBugReport(context),
                buildSendFeedback(context),
              ],
            ),
          ],
        ),
      ),
    );
  }



  Widget buildLogout(BuildContext context)=> SimpleSettingsTile(
    title: 'Sign out',
    subtitle: '',
    leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent),
    onTap: () {
      FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
      Get.back();
      Get.snackbar(
        "Logged Out",
        "You are successfully logged out.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black54,
        icon: Icon(Icons.warning_amber_outlined,
            color: Colors.pink
        ),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
        borderWidth: 1,
        borderColor: Colors.black,
        maxWidth: 1000,
      );
    }
  );

  Widget buildDarkMode() => SwitchSettingsTile(
      title: 'Dark Mode',
      settingKey: keyDarkMode,
    leading: IconWidget(
      icon: Icons.dark_mode,
      color: Color(0xFF642ef3),
    ),
    onChange: (_) {},
  );

  Widget buildDeleteAccount(BuildContext context)=> SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: 'All you info will be deleted',
    leading: IconWidget(icon: Icons.delete, color: Colors.pink),
    onTap: () {
      FirebaseAuthMethods(FirebaseAuth.instance).deleteAccount(context);
      Get.back();
      Settings.clearCache();
      Get.snackbar(
        "Deleted Account",
        "You have successfully deleted your account",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black54,
        icon: Icon(Icons.warning_amber_outlined,
            color: Colors.pink
        ),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
        borderWidth: 1,
        borderColor: Colors.black,
        maxWidth: 1000,
      );
    },
  );
  Widget buildBugReport(BuildContext context)=> SimpleSettingsTile(
    title: 'Bug Report',
    subtitle: '',
    leading: IconWidget(icon: Icons.bug_report, color: Colors.teal),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return BugReportPage();
      },),);

    },
  );
  Widget buildSendFeedback(BuildContext context)=> SimpleSettingsTile(
    title: 'Send Feedback',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.purple),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return SendFeedBackPage();
      },),);

    },
  );

}