import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-80,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://privacypolicy.bhstigers.repl.co',
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

    );
  }
}
