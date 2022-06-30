import 'package:bhs_app/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class YearCalPage extends StatefulWidget {
  const YearCalPage({Key? key}) : super(key: key);

  @override
  State<YearCalPage> createState() => _YearCalPageState();
}

class _YearCalPageState extends State<YearCalPage> {
  late PdfViewerController _pdfViewerController;
  double zoom = 1.25;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        actions: <Widget>[

              //zoom in
          IconButton(onPressed: (){
            _pdfViewerController.zoomLevel = (zoom  = zoom + .5);
          },

              // zoom out
          icon: Icon(Icons.zoom_in, color: Colors.white,)),
          IconButton(onPressed: (){
            _pdfViewerController.zoomLevel = (zoom  = zoom - .5);
          },
              icon: Icon(Icons.zoom_out, color: Colors.white,))
        ],
          elevation: 2,
        ),
      body: SafeArea(
          child: Scaffold(
            body: SfPdfViewer.network(
              'https://www.bentonvillek12.org//cms/lib/ar02203372/Centricity/Domain/4517/22-23%20Calendar%20BOE%20Approved%2003-15-2022.pdf',
              controller: _pdfViewerController
            ),
          ),
      ),
    );
  }
}
