// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../showSnackBar.dart';
import 'firebase_auth_methods.dart';
import 'forgot_pw_page.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isHiddenPassword = true;

  // toggle password
  void togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }

  //sign in function
  Future signIn() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signInWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      context: context,
    );
  }

  // dispose text controllers to save memory
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  //main build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey[200],
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0,
                      image: AssetImage(
                        'images/img1.png'

                      ),
                    fit: BoxFit.cover
                  ),

                ),
                child: SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // logo/ image icon
                          Container(
                            height: 100,
                              width: 100,
                              child: Image.asset('images/icon.jpeg')),

                        // welcome and page text
                          Text('BHS Tigers',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                        ),
                          SizedBox(height: 10),
                          Text('The All In One Tiger Den',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 150),

                          //email text field
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: SizedBox(
                              width: 400,
                              height: 50,
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
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
                          ),

                          // password text field
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: SizedBox(

                              width: 400,
                              height: 50,
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue.shade700),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.security),
                                    fillColor: Colors.grey[200],
                                    filled: true,
                                    suffixIcon: InkWell(
                                      onTap: togglePasswordVisibility,
                                      child: Icon(
                                          isHiddenPassword
                                              ?Icons.visibility
                                              :Icons.visibility_off
                                      ),
                                    ),
                                ),
                                obscureText: isHiddenPassword,
                              ),
                            ),
                          ),

                          // forgot password?
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                       return ForgotPasswordPage();
                                    },),);
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),


                          //sign in button
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: signIn,
                              child: Container(
                                height: 50,
                                width: 300,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
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
                          SizedBox(height: 10),

                          //Google Sign in
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: SizedBox(

                              height: 50,
                              width: 300,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    minimumSize: Size(double.infinity, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    )
                                ),
                                onPressed: () {
                                  // final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                                  // provider.googleLogin();
                                  FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);

                                },
                                icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue),
                                label: Text("Sign In With Google"),
                              ),
                            ),
                          ),
                          //Twitter Sign In
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          //   child: SizedBox(
                          //     height: 50,
                          //     width: 300,
                          //     child: ElevatedButton.icon(
                          //       style: ElevatedButton.styleFrom(
                          //           primary: Colors.white,
                          //           onPrimary: Colors.black,
                          //           minimumSize: Size(double.infinity, 60),
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(13),
                          //           )
                          //       ),
                          //       onPressed: () async {
                          //         FirebaseAuthMethods(FirebaseAuth.instance).signInWithTwitter(context);
                          //       },
                          //       icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
                          //       label: Text("Sign In With Twitter"),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 20),

                          // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member? ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: Text(
                                'Register now',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],),
                          SizedBox(height: 30),
                      ],),
                    ),
                  ),
            ),
              ),
    );
  }
}
