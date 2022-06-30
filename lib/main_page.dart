import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_page.dart';
import 'closed_page.dart';
import 'nav_page.dart';
import 'theme_services.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
