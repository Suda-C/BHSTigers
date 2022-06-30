// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bhs_app/appbar.dart';
import 'package:bhs_app/theme.dart';
import 'package:bhs_app/year_cal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  late WebViewController controller;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity - 2, 90),
                  maximumSize: Size(double.infinity, 101),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  )),
              onPressed: () {
                launchEmail(
                  toEmail: "",
                  subject: "",
                  message: "Hello, ",
                );
              },
              label: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10.0),
                child: Text(
                  "Email Teachers and Staff",
                  style: titleStyle.copyWith(color: Colors.black, fontSize: 18),
                ),
              ),
              icon: Container(
                  height: 90,
                  width: 80,
                  child: Image.asset("images/gmail.png")),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 2,
            thickness: 3,
            indent: 15,
            endIndent: 15,
          ),

          SizedBox(
            height: 5,
          ),


         Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: index == 0
                        ? BorderSide(width: 1.5, color: Colors.blue)
                        : BorderSide(width: .5, color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Text(
                    'Twitter',
                    style: subTitleStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: index == 1
                        ? BorderSide(width: 1.5, color: Colors.blue)
                        : BorderSide(width: .5, color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Text(
                    'Instagram',
                    style: subTitleStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: index == 2
                        ? BorderSide(width: 1.5, color: Colors.blue)
                        : BorderSide(width: .5, color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                  child: Text(
                    "Facebook",
                    style: subTitleStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),


                SizedBox(
                  width: 5,
                ),

                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: index == 3
                        ? BorderSide(width: 1.5, color: Colors.blue)
                        : BorderSide(width: .5, color: Colors.grey),
                  ),
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                  child: Text(
                    "BHS Website",
                    style: subTitleStyle.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),


              ],
            ),


          IndexedStack(
            index: index,
            children: <Widget>[

              Center(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height-262,
                        child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://twitter.com/bentonvillehs?lang=en',
                        onWebViewCreated: (controller) {
                          this.controller = controller;
                        },
                        onPageFinished: (controller){

                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('header')[0].style.display='none'"
                          );
                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('footer')[0].style.display='none'"
                          );

                        },
                      ),
                  ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height-262,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://www.instagram.com/bentonvilletigers/?hl=en',
                        onWebViewCreated: (controller) {
                          this.controller = controller;
                        },
                        onPageFinished: (controller){

                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('header')[0].style.display='none'"
                          );
                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('footer')[0].style.display='none'"
                          );

                        },
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height-262,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://www.facebook.com/BentonvilleHigh',
                        onWebViewCreated: (controller) {
                          this.controller = controller;
                        },
                        onPageFinished: (controller){

                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('header')[0].style.display='none'"
                          );
                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('footer')[0].style.display='none'"
                          );

                        },
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height-262,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://www.bentonvillek12.org/bhs',
                        onWebViewCreated: (controller) {
                          this.controller = controller;
                        },
                        onPageFinished: (controller){

                          this.controller.evaluateJavascript(
                              "document.getElementsByTagName('footer')[0].style.display='none'"
                          );

                        },
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),

        ],
      ),
    );
  }

  Future launchEmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final url =
        "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}";
    await launch(url);
  }
}
