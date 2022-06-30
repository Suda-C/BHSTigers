// import 'package:bhs_app/theme.dart';
// import 'package:bhs_app/user_simple_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:twitter_login/entity/user.dart';
//
// import 'input_field.dart';
//
// class SchedulePage extends StatefulWidget {
//   const SchedulePage({Key? key}) : super(key: key);
//
//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//
//   String first = '';
//   String second = '';
//   String third = '';
//   String fourth = '';
//   String fifth= '';
//   String seventh = '';
//   String eighth = '';
//
//   final _firstController = TextEditingController();
//   final _secondController = TextEditingController();
//   final _thirdController = TextEditingController();
//   final _fourthController = TextEditingController();
//   final _fifthController = TextEditingController();
//   final _seventhController = TextEditingController();
//   final _eighthController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     first = UserSimplePreferences.getFirst()??'No Class';
//     second = UserSimplePreferences.getFirst()??'No Class';
//     third = UserSimplePreferences.getFirst()??'No Class';
//     fourth = UserSimplePreferences.getFirst()??'No Class';
//     fifth = UserSimplePreferences.getFirst()??'No Class';
//     seventh = UserSimplePreferences.getFirst()??'No Class';
//     eighth = UserSimplePreferences.getFirst()??'No Class';
//
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: const Icon(
//               Icons.arrow_back_ios,
//               size: 20,
//               color: Colors.black,
//             ),
//           ),
//           actions: const [
//             Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//             SizedBox(
//               width: 20,
//             )
//           ]),
//       body: Container(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Edit Your Classes',
//                 style: headingStyle,
//               ),
//
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               onChanged: (first) => setState(() => this.first = first),
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _firstController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "1st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _secondController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "2st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _thirdController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "3st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _fourthController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "4st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _fifthController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "5st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _seventhController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "7st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 52,
//                       margin: EdgeInsets.only(top: 8),
//                       padding: EdgeInsets.only(left: 14),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1.0),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               autofocus: false,
//                               cursorColor: Colors.grey[700],
//                               controller: _eighthController,
//                               style: subTitleStyle,
//                               decoration: InputDecoration(
//                                 hintText: "8st Period Class",
//                                 hintStyle: subTitleStyle,
//                                 focusedBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                     width: 0,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 40,),
//
//               GestureDetector(
//                 onTap: () async {
//                   await UserSimplePreferences.setAll(first, second, third, fourth, fifth, seventh, eighth);
//                   Get.back();
//                 },
//                 child: Container(
//                   width: 120,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.blue,
//                   ),
//                   child: const Center(
//                     child: Text('Create Event',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
