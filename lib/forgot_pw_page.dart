// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 class ForgotPasswordPage extends StatefulWidget {
   const ForgotPasswordPage({Key? key}) : super(key: key);

   @override
   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
 }

 class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

   final _emailController = TextEditingController();

   @override
   void dispose() {
     _emailController.dispose();
     super.dispose();
   }
   Future passwordReset() async {
     try {
       await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
       showDialog(
           context: context,
           builder: (context) {
             return AlertDialog(
               actions: [
                 TextButton(
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     child: Text('Ok')
                 )
               ],
               content: Text("Password reset link successfully sent to the email provided."),
             );
           }
       );
     } on FirebaseAuthException catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok')
                )
              ],
              content: Text(e.message.toString()),
            );
          }
        );
     }
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
          elevation: 3,
       ),
       backgroundColor: Colors.grey[300],
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             //rest test
             Text(
               'Enter your email below to receive a password reset link.',
               textAlign: TextAlign.center,
               style: TextStyle(
                   fontSize: 19
               ),
             ),

             //email text field
             SizedBox(height: 30),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:7.0),
               child: TextField(
                 controller: _emailController,
                 decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
                         borderRadius: BorderRadius.circular(12)
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.blue.shade700),
                       borderRadius: BorderRadius.circular(12),
                     ),
                     hintText: 'Email',
                     fillColor: Colors.grey[200],
                     filled: true
                 ),
               ),
             ),

             SizedBox(height: 10),
             MaterialButton(onPressed: passwordReset,
              child: Text('Reset Password'),
               color: Colors.blue[700],
             ),
           ],
         ),
       )
     );
   }
 }
