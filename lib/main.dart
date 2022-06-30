import 'package:bhs_app/nav_page.dart';
import 'package:bhs_app/onboarding.dart';
import 'package:bhs_app/theme.dart';
import 'package:bhs_app/theme_services.dart';
import 'package:bhs_app/user_simple_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_page.dart';
import 'auth_page.dart';
import 'db/dbhelper.dart';
import 'firebase_options.dart';
import 'package:bhs_app/controllers/task_controller.dart';
import 'closed_page.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserSimplePreferences.init();

  // final prefs = await SharedPreferences.getInstance();
  // final showHome = prefs.getBool('showHome') ?? false;


  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
      cacheKey: AccountPage.keyDarkMode,
        defaultValue: false,
        builder: (_, isDarkMode, __) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDarkMode? ThemeData.dark().copyWith(
            primaryColor: Colors.teal,
            accentColor: Colors.white,
            scaffoldBackgroundColor: Color(0xFF170635),
            canvasColor: Color(0xFF170635),
          ): ThemeData.light().copyWith(
            accentColor: Colors.black
          ),
          home: Scaffold(
            body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot){
            if (snapshot.hasData){
              return Home3Page();
            }
            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Somthing went wrong!'));
            }
            else {
              return AuthPage();
            }
          },
        ),
      )
        ),
    );
  }
}
