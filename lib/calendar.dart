// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bhs_app/add_task_bar.dart';
import 'package:bhs_app/button.dart';
import 'package:bhs_app/controllers/task_controller.dart';
import 'package:bhs_app/task_tile.dart';
import 'package:bhs_app/theme.dart';
import 'package:bhs_app/year_cal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'account_page.dart';
import 'appbar.dart';
import 'models/task.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late WebViewController controller;
  bool toggle = false;
  int index = 0;
  var _borderClr = BorderSide();
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());

  final images = [
    'images/May.png',
    'images/June.png',
    'images/July.png',
    'images/August.png',
    'images/September.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              children: [
                SizedBox(height: 25,width: 40,),
                Text(
                  "Today",
                  style: subHeadingStyle,
                ),
              ],
            ),
            actions: [
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
            ]
        ),
      ),
      body: IndexedStack(
            index: index,
            children: <Widget>[
              Column(
                children: [
                  _addTaskBar(),
                  _addDateBar(),
                  SizedBox(height: 10,),
                  _showTasks(),
                ],
              ),

              Center(
                child: Column(
                  children: [
                     _addTaskBar2(),
                    Container(
                      height: MediaQuery.of(context).size.height-235,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: 'https://www.bentonvillek12.org/Page/3926#calendar7435/20220627/month',
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
              Center(
                child: Column(
                  children: [
                     _addTaskBar2(),
                     SfPdfViewer.network('https://www.bentonvillek12.org/site/handlers/icalfeed.ashx?MIID=7435'),
                  ],
                ),
              ),


            ],
          ),
    );
  }
  //
  // Widget buildImage(String image, int index) => Container(
  //   margin: EdgeInsets.symmetric(horizontal: 12),
  //   color: Colors.grey,
  //   child: Image.asset(
  //     image,
  //     fit: BoxFit.fitHeight
  // ),
  // );

  _showTasks() {
    return Expanded(
      child: Obx((){
        _taskController.getTasks();
        return ListView.builder(

          itemCount: _taskController.taskList.length,

          itemBuilder: (_, index){
             Task task = _taskController.taskList[index];
            // print(task.toJson());
            // print(_taskController.taskList .length);
             if (task.repeat=='Daily') {
               return  AnimationConfiguration.staggeredList(
                   position: index,
                   child: SlideAnimation(
                       child: FadeInAnimation(
                         child: Row(
                           children: [
                             GestureDetector(
                                 onTap: (){
                                   _showBottomSheet(context, _taskController.taskList[index]);
                                 },
                                 child: TaskTile(_taskController.taskList[index])
                             )
                           ],
                         ),
                       )
                   )
               );
             }
             if (task.date== DateFormat.yMd().format(_selectedDate)){
               return  AnimationConfiguration.staggeredList(
                   position: index,
                   child: SlideAnimation(
                       child: FadeInAnimation(
                         child: Row(
                           children: [
                             GestureDetector(
                                 onTap: (){
                                   _showBottomSheet(context, _taskController.taskList[index]);
                                 },
                                 child: TaskTile(_taskController.taskList[index])
                             )
                           ],
                         ),
                       )
                   )
               );
             } else{
               return Container();
             }


            });
      }),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose=false,
    required BuildContext context,
  }){
      return GestureDetector(
        onTap:onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: 55,
          width: MediaQuery.of(context).size.width*0.9,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isClose==true?Colors.grey[300]!:clr
            ),
            borderRadius: BorderRadius.circular(20),
            color: isClose==true?Colors.transparent:clr,
          ),
          child: Center(
            child: Text(
              label,
              style: isClose?titleStyle:titleStyle.copyWith(color: Colors.white),
            ),
          ),
        )
      );
  }

  _showBottomSheet(BuildContext context, Task task){
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top:4),
        height: task.isCompleted==1?
        MediaQuery.of(context).size.height*0.24:
        MediaQuery.of(context).size.height*0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            Spacer(),
            task.isCompleted==1
            ?Container()
                : _bottomSheetButton(
                label: "Task Completed",
                onTap: (){
                  _taskController.markTaskCompleted(task.id!);
                  Get.back();
                },
              clr: Colors.blue,
                context: context,
            ),
            _bottomSheetButton(
              label: "Delete Task",
              onTap: (){
                _taskController.delete(task);
                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
            ),
            SizedBox(height: 20,),
            _bottomSheetButton(
              label: "Close",
              onTap: (){
                Get.back();
              },
              clr: Colors.red[300]!,
              isClose: true,
              context: context,
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }

  _addDateBar(){
    return Container(
      margin: const EdgeInsets.only(top: 20, left:20),
      child: DatePicker(
        DateTime.now(),
        height:100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),),

        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        onDateChange:  (date){
         setState(() {
           _selectedDate = date;
         });
        },


      ),
    );
  }

  _addTaskBar(){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMd().format(DateTime.now()),
                  style: headingStyle,
                ),


                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==0?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),
                       onPressed: (){setState(() {index=0;});},
                       child: Text(
                         'Daily',
                         style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                       ),
                     ),
                    SizedBox(width: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==1?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),

                      onPressed: (){setState((){index=1;});},
                      child: Text(
                        'Monthly',
                        style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==2?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),

                      onPressed:  (){
                        setState((){index=2;});
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return YearCalPage();
                        },),);
                      },
                      child: Text(
                        "Yearly",
                        style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyButton(label: "+ Add Event", onTap: () async {

            await Get.to(()=>AddTaskPage());
            _taskController.getTasks();

          }
          )
        ],
      ),
    );
  }

  _addTaskBar2(){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMd().format(DateTime.now()),
                  style: headingStyle,
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==0?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),
                      onPressed: (){setState(() {index=0;});},
                      child: Text(
                        'Daily',
                        style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==1?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),

                      onPressed: (){setState((){index=1;});},
                      child: Text(
                        'Monthly',
                        style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 5,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: index==2?BorderSide(width: 1.5, color: Colors.blue):BorderSide(width: .5, color: Colors.grey),
                      ),

                      onPressed: (){
                        setState((){index=2;});
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return YearCalPage();
                          },),);
                        },
                      child: Text(
                        'Yearly',
                        style: subTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
