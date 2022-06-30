import 'package:bhs_app/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SouthMenuPage extends StatefulWidget {
  const SouthMenuPage({Key? key}) : super(key: key);

  @override
  State<SouthMenuPage> createState() => _SouthMenuPageState();
}

class _SouthMenuPageState extends State<SouthMenuPage> {
  late WebViewController controller;
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(toggle==false?"South Cafeteria Menu":"North Cafeteria Menu"),
        centerTitle: true,
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://bentonville.nutrislice.com/menu/bentonville-high-school-south/breakfast',
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.import_export, size: 32),
        onPressed: () async {
          // toggle==false?controller.loadUrl('https://bentonville.nutrislice.com/menu/bentonville-high-school/breakfast'):controller.loadUrl('https://bentonville.nutrislice.com/menu/bentonville-high-school-south/breakfast');
          // final url = await controller.currentUrl();
          // setState((){toggle = !toggle;});
          },
      ),
    );
  }
}
