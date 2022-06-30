import 'package:bhs_app/appbar.dart';
import 'package:bhs_app/south_menu.dart';
import 'package:bhs_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'account_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late WebViewController controller;
  bool toggle = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text(toggle==false?"South Cafeteria Menu":"North Cafeteria Menu", style: TextStyle(color: Colors.black,)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions:  [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AccountPage();
                },
                ));
              },
              child: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20,)
          ],

        ),
      ),
      body: Column(
        children: [

          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height-130,
              child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: 'https://bentonville.nutrislice.com/menu/bentonville-high-school-south/breakfast/2022-05-03',
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.import_export, size: 32),//CircleAvatar(child: Image.asset('images/swap.png'), backgroundColor: Colors.transparent,),
        onPressed: () async {
           toggle==false?controller.loadUrl('https://bentonville.nutrislice.com/menu/bentonville-high-school/breakfast/2022-05-03'):controller.loadUrl('https://bentonville.nutrislice.com/menu/bentonville-high-school-south/breakfast/2022-05-03');
           final url = await controller.currentUrl();
           setState((){toggle = !toggle;});
        },
      ),
    );
  }
}
