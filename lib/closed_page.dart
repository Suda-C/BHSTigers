// // ignore_for_file: prefer_const_constructors
// // ignore_for_file: prefer_const_literals_to_create_immutables
//
// import 'package:flutter/material.dart';
//
// import 'explore.dart';
// import 'home2_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int index = 0;
//
//   final screens = [
//     Home2Page(),
//     Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
//     Center(child: Text('Social Media', style: TextStyle(fontSize: 60))),
//     ExplorePage(),
//     Center(child: Text('Lunch Menu', style: TextStyle(fontSize: 72))),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: NavigationBarTheme(
//         data: NavigationBarThemeData(
//           indicatorColor: Colors.blue[100],
//         ),
//         child: NavigationBar(
//           labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
//           height: 60,
//           backgroundColor: Colors.blueGrey[100],
//           selectedIndex: index,
//           onDestinationSelected: (index) =>
//             setState(() => this.index = index),
//           destinations: [
//             NavigationDestination(
//                 icon: Icon(Icons.home_outlined),
//                 selectedIcon: Icon(Icons.home),
//                 label: 'Home'
//             ),
//             NavigationDestination(
//                 icon: Icon(Icons.lunch_dining_outlined),
//                 selectedIcon: Icon(Icons.lunch_dining),
//                 label: 'Lunch'
//             ),
//             NavigationDestination(
//                 icon: Icon(Icons.calendar_month_outlined),
//                 selectedIcon: Icon(Icons.calendar_month),
//                 label: 'Calendar'
//             ),
//             NavigationDestination(
//                 icon: Icon(Icons.sports_baseball_outlined),
//                 selectedIcon: Icon(Icons.sports_baseball),
//                 label: 'Explore'
//             ),
//             NavigationDestination(
//                 icon: Icon(Icons.account_circle_outlined),
//                 selectedIcon: Icon(Icons.account_circle),
//                 label: 'Account'
//             ),
//           ],
//         ),
//       ),
//       body: screens[index]
//     );
//   }
// }
//
