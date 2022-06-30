// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bhs_app/calendar.dart';
import 'package:bhs_app/schedule_page.dart';
import 'package:bhs_app/theme.dart';
import 'package:bhs_app/user_simple_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'account_page.dart';
import 'appbar.dart';
import 'connect_page.dart';
import 'explore.dart';
import 'forgot_pw_page.dart';
import 'home_page.dart';
import 'closed_page.dart';
import 'menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home3Page extends StatefulWidget {
  const Home3Page({Key? key}) : super(key: key);

  @override
  State<Home3Page> createState() => _HomePage3State();
}

class _HomePage3State extends State<Home3Page> {
  int index = DateTime.now().weekday==1||DateTime.now().weekday==3?0:1;

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  int currentIndex = 0;
  int currentCurrentIndex = 0;
  User user = FirebaseAuth.instance.currentUser!;


  var _userName = "";


  String first = '';
  String second = '';
  String third = '';
  String fourth = '';
  String fifth= '';
  String seventh = '';
  String eighth = '';

  final _firstController = TextEditingController();
  final _secondController = TextEditingController();
  final _thirdController = TextEditingController();
  final _fourthController = TextEditingController();
  final _fifthController = TextEditingController();
  final _seventhController = TextEditingController();
  final _eighthController = TextEditingController();

  void initState() {
    super.initState();
    _getUserName();

    setState(() {
      first = UserSimplePreferences.getFirst()??'No Class';
      second = UserSimplePreferences.getFirst()??'No Class';
      third = UserSimplePreferences.getFirst()??'No Class';
      fourth = UserSimplePreferences.getFirst()??'No Class';
      fifth = UserSimplePreferences.getFirst()??'No Class';
      seventh = UserSimplePreferences.getFirst()??'No Class';
      eighth = UserSimplePreferences.getFirst()??'No Class';
    });


  }

  //user
  List<String> docIDs = [];

  final screens = [
    Home2Page(),
    MenuPage(),
    Schedule(),
    ExplorePage(),
    Center(child: Text('NEWS', style: TextStyle(fontSize: 72))),
  ];

  Future<void> _getUserName() async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc((await user).uid)
        .get()
        .then((value) {
      setState(() {
        //_userName = value.data['first name'].toString();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentCurrentIndex,
      children: [
        Scaffold(

        resizeToAvoidBottomInset: false,

        body: Container(
          child: IndexedStack(
            index: currentIndex,
            children: [
              //index 0
              Scaffold(
                backgroundColor: Colors.grey[100],
                resizeToAvoidBottomInset: false,
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(DateTime.now().hour < 12 ? "Good morning." : DateTime.now().hour < 16? "Good afternoon.":"Good Evening.",
                                  style: subTitleStyle.copyWith(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  DateFormat.yMMMd().format(DateTime.now()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),

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

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return SchedulePage();
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 12),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            //  width: SizeConfig.screenWidth * 0.78,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(24),
                              color: Colors.blue,
                            ),

                            child: Row(
                                children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Your Schedule",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () {
                                            setState((){
                                              currentCurrentIndex = 1;
                                            });
                                          },
                                          child: const Icon(Icons.edit,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),

                                      ],
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          height: index == 0
                                              ?30:27,
                                          width: 75,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: index == 0
                                                  ?Colors.orange[200]:Colors.grey[300],
                                              elevation: 5,
                                              side: index == 0
                                                  ? BorderSide(
                                                  width: 1, color: Colors.blue)
                                                  : BorderSide(
                                                  width: 2, color: Colors.blue),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                index = 0;
                                              });
                                            },
                                            child: Text(
                                              "A-Day",
                                              style: subTitleStyle.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,fontSize: 15),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          height: index == 1
                                              ?30:27,
                                          width: 75,
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: index == 1
                                                  ?Colors.orange[200]:Colors.grey[300],
                                              elevation: 5,
                                              side: index == 1
                                                  ? BorderSide(
                                                  width: 1, color: Colors.blue)
                                                  : BorderSide(
                                                  width: 2, color: Colors.blue),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                index = 1;
                                              });
                                            },
                                            child: Text(
                                              "B-Day",
                                              style: subTitleStyle.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    IndexedStack(index: index, children: <Widget>[

                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                first,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                second,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                third,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                fourth,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                fifth,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Flex",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                seventh,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                eighth,
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              Icon(
                                                Icons.access_time_rounded,
                                                color: Colors.grey[200],
                                                size: 18,
                                              ),
                                              Text(
                                                "7:15 - 8:55",
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[100]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                    ]),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width:
                                      (MediaQuery.of(context).size.width / 2) - 35,
                                  height:
                                      (MediaQuery.of(context).size.width / 2) - 50,
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    //  width: SizeConfig.screenWidth * 0.78,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.green[300],
                                    ),
                                    child: Image.asset("images/salad.png"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Lunch",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 2;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 20),
                                  width:
                                      (MediaQuery.of(context).size.width / 2) - 35,
                                  height:
                                      (MediaQuery.of(context).size.width / 2) - 50,
                                  child: Container(
                                      padding: EdgeInsets.all(12),
                                      //  width: SizeConfig.screenWidth * 0.78,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.blue[200],
                                      ),
                                      child: Image.asset("images/calendar.png")),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Calendar",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 3;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width:
                                      (MediaQuery.of(context).size.width / 2) - 35,
                                  height:
                                      (MediaQuery.of(context).size.width / 2) - 50,
                                  child: Container(
                                    padding: EdgeInsets.all(14),
                                    //  width: SizeConfig.screenWidth * 0.78,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.red[200],
                                    ),
                                    child: Image.asset("images/search.png"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Explore",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = 4;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 20),
                                  width:
                                      (MediaQuery.of(context).size.width / 2) - 35,
                                  height:
                                      (MediaQuery.of(context).size.width / 2) - 50,
                                  child: Container(
                                      padding: EdgeInsets.all(12),
                                      //  width: SizeConfig.screenWidth * 0.78,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(
                                                0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.orange[200],
                                      ),
                                      child: Image.asset("images/img.png")),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Connect",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              MenuPage(),

              Schedule(),

              ExplorePage(),

              ConnectPage(),

            ],
          ),
        ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[50],
          currentIndex: currentIndex,
          iconSize: 25,
          selectedFontSize: 14,
          showUnselectedLabels: true,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lunch_dining_outlined),
              activeIcon: Icon(Icons.lunch_dining),
              label: 'Lunch',
              backgroundColor: Colors.blueGrey[100],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              activeIcon: Icon(Icons.calendar_month),
              label: 'Calendar',
              backgroundColor: Colors.blueGrey[100],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: 'Explore',
              backgroundColor: Colors.blueGrey[100],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle),
              label: 'Connect',
              backgroundColor: Colors.blueGrey[100],
            ),
          ],
        ),
      ),

        Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  setState((){
                    currentCurrentIndex = 0;
                  });
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              actions: const [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                )
              ]),
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Your Classes',
                    style: headingStyle,
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (first) => setState(() {
                                    this.first = first;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _firstController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "1st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (second) => setState(() {
                                    this.second = second;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _secondController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "2st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (third) => setState(() {
                                    this.third = third;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _thirdController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "3st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (fourth) => setState(() {
                                    this.fourth = fourth;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _fourthController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "4st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (fifth) => setState(() {
                                    this.fifth = fifth;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _fifthController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "5st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (seventh) => setState(() {
                                    this.seventh = seventh;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _seventhController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "7st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 52,
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  onChanged: (eighth) => setState(() {
                                    this.eighth = eighth;
                                  }),
                                  autofocus: false,
                                  cursorColor: Colors.grey[700],
                                  controller: _eighthController,
                                  style: subTitleStyle,
                                  decoration: InputDecoration(
                                    hintText: "8st Period Class",
                                    hintStyle: subTitleStyle,
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 40,),

                  GestureDetector(
                    onTap: () async {
                      await UserSimplePreferences.setAll(first, second, third, fourth, fifth, seventh, eighth);
                      setState((){
                        currentCurrentIndex = 0;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: const Center(
                        child: Text('Create Event',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );


  }

  _fetch() async {
    FirebaseFirestore.instance
        .collection('users')
        .where('first name', isEqualTo: 'test')
        .get()
        .then((value) => null);
  }
}
