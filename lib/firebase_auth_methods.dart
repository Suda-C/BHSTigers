import 'package:bhs_app/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Get User Details
  User get user  => _auth.currentUser!;


  //State Persistence
  // Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  //Email Sign up
  Future<void> signUpWithEmail ({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Email login
  Future<void> signInWithEmail ({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb){
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');

        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth = await googleUser
            ?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          UserCredential userCredential = await _auth.signInWithCredential(
              credential);

          // if (userCredential.user != null){
          //   if (userCredential.additionalUserInfo!.isNewUser){
          //
          //   }
          // }
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Twitter Login
  Future<void> signInWithTwitter(BuildContext context) async {
    try {
      final twitterLogin =  TwitterLogin(
          apiKey: 'v7h9igIEIL8ruLuQOjNz4aI82',
          apiSecretKey: 'YS5tyo1qZTWEYN2quegPJ1ae0bOVhAXJ1JaY3qEvgz1UvECwuU',
          redirectURI: 'fbhsf://',
      );

      await twitterLogin.login().then((value) async {
        if (value.authToken != null && value.authTokenSecret != null) {
          final twitterAuthCredential = TwitterAuthProvider.credential(
            accessToken: value.authToken!,
            secret: value.authTokenSecret!,
          );
          await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
        }
      });

    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Sign out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Delete account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

}