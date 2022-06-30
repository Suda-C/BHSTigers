import 'package:flutter/material.dart';

import 'account_page.dart';

Widget buildAppBar(BuildContext context){
    return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AccountPage();
                  },
                ));
              },
              child: const Icon(Icons.account_circle_outlined,
                color: Colors.black, size: 30,
              ),
            ),
            SizedBox(width: 20,)
          ]
      );
}
