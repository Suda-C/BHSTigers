
import 'package:bhs_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ec.dart';

class ECPage extends StatelessWidget {
  final EC ec;

  const ECPage({
    Key? key, required this.ec,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ec.title),
      ),
      body: Column(
        children: [
          Image.network(
          ec.urlImage,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          ),

          SizedBox(height: 30),
          SizedBox(height: 10,),
          Text("Sponsor Name: ${ec.sponsor}", style: titleStyle.copyWith(fontSize: 18),),
          SizedBox(height: 10,),
          Text(ec.email==""?"":"Sponsor email address: ${ec.email}", style: titleStyle.copyWith(fontSize: 18),),
          SizedBox(height: 10,),
          Text(ec.grade==""?"":"Grade Level: ${ec.grade}", style: titleStyle.copyWith(fontSize: 18),),
          SizedBox(height: 60),

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
              onPressed: () => launchEmail(
                toEmail: ec.email,
                subject: ec.title,
                message: "Dear " + ec.sponsor + ", ",
              ),
              label: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10.0),
                child: Text(
                  "Email Sponsor",
                  style: titleStyle.copyWith(color: Colors.black, fontSize: 18),
                ),
              ),
              icon: Container(
                  height: 90,
                  width: 80,
                  child: Image.asset("images/gmail.png")),
            ),
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

