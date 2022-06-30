import 'package:bhs_app/forgot_pw_page.dart';
import 'package:bhs_app/privacy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'icon_widget.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  static const keyGrade = 'key-grade';
  static const keySchool = 'key-school';

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
      title: 'Account Settings',
    subtitle: 'Privacy & Security',
    leading: IconWidget(icon: Icons.person, color: Colors.green),
    child: SettingsScreen(
      title: 'Account Settings',
      children: [
        buildGrade(),
        buildSchool(),
        buildPassword(),
        buildPrivacy(context),
      ],
    ),
  );

  Widget buildPrivacy(BuildContext context)=> SimpleSettingsTile(
    title: 'Privacy',
    subtitle: '',
    leading: IconWidget(icon: Icons.privacy_tip, color: Colors.blue),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
      return PrivacyPage();
    },),);
    },
  );

  Widget buildPassword()=> SimpleSettingsTile(
    title: 'Password Reset',
    subtitle: '',
    leading: IconWidget(icon: Icons.password, color: Colors.purple),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ForgotPasswordPage();
      },),);
    },
  );

  Widget buildGrade() => DropDownSettingsTile(
      title: "Grade",
      settingKey: keyGrade,
      selected: 1,
      values: <int, String>{
        1: '9th',
        2: "10th",
        3: "11th",
        4: "12th",
      },
    onChange: (language) {/* NOOP */},
  );

  Widget buildSchool()=> TextInputSettingsTile(
    title: 'School',
    settingKey: keySchool,
    initialValue: 'Bentonville High School',
    onChange: (location) {/* NOOP */},
  );



}
