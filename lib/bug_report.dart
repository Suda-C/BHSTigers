import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BugReportPage extends StatefulWidget {
  const BugReportPage({Key? key}) : super(key: key);

  @override
  State<BugReportPage> createState() => _BugReportPageState();
}

class _BugReportPageState extends State<BugReportPage> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height-80,
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSeCabljiTg9sD1eJFQmsUbLBizovDNAuU2GLN6DbC02qaKsNg/viewform?usp=sf_link',
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
    );
  }
}
