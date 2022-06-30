// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_auth_methods.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _gradYear = TextEditingController();

  bool isHiddenPassword = true;

  // toggle password
  void togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }


  //sign up function
  Future signUp() async {
    // tries to sign up the user
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
    );

    //adds user's data to Firestone database
    addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        //TODO implement check for int
        int.parse(_gradYear.text.trim()),

    );


  }

  // function to sends data to cloud Firestore database
  Future addUserDetails(String firstName, String lastName, String email, int gradYear) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'grad year': gradYear,
    });
  }



  // disposes text controllers to save memory
  @override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  _firstNameController.dispose();
  _lastNameController.dispose();
  _gradYear.dispose();
  super.dispose();
  }

  // app build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // logo/ image icon
                Icon(
                  Icons.android,
                  size: 100,
                ),
                // welcome and page text
                Text('Hello there!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 10),
                Text('Register now below',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 60),

                //first and last name text fields in a row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade700),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'First Name',
                              fillColor: Colors.grey[200],
                              filled: true
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Flexible(
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade700),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Last Name ',
                              fillColor: Colors.grey[200],
                              filled: true
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                //email  text field
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                        prefixIcon: Icon(Icons.email_outlined),
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                  ),
                ),

                // gradClassYear text field
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _gradYear,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade700),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Graduation Year',
                        prefixIcon: Icon(Icons.school_outlined),
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                    obscureText: true,
                  ),
                ),

                // password text field
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade700),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: InkWell(
                           onTap: togglePasswordVisibility,
                           child: Icon(
                            isHiddenPassword
                                ?Icons.visibility
                                :Icons.visibility_off
                           ),
                        ),
                        fillColor: Colors.grey[200],
                        filled: true
                    ),
                    obscureText: isHiddenPassword,
                  ),
                ),


                //sign up button
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:  FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),


                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],),
              ],),
          ),
        ),
      ),
    );

  }
}
