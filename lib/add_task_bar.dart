// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bhs_app/appbar.dart';
import 'package:bhs_app/button.dart';
import 'package:bhs_app/input_field.dart';
import 'package:bhs_app/showSnackBar.dart';
import 'package:bhs_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'controllers/task_controller.dart';
import 'models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = DateFormat("hh:mm a").format(new DateTime.now().add(new Duration(hours: 1))).toString();
  String _startTime =  DateFormat("hh:mm a").format(DateTime.now()).toString();

  int _selectedRemind = 5;
  List<int> remindList = [
    5, 15, 30, 60
  ];

  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None", "Daily", "Weekly", "Monthly"
  ];

  int _selectedColor=0;

  Color btnColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
                Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
            SizedBox(width: 20,)
          ]
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Event',
                style: headingStyle,
              ),
              MyInputField(title: "Title", hint: "Enter your title", controller: _titleController,),
              MyInputField(title: "Event", hint: "Enter your event", controller: _noteController,),
              MyInputField(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined,
                  color: Colors.grey),
                  onPressed: (){
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Start Time" ,
                        hint:  _startTime,
                        widget: IconButton(
                          onPressed: (){
                            _getTimeFromUser(isStartTime:true);
                          },
                          icon: Icon(Icons.access_time_rounded),
                          color:Colors.grey,
                        ),
                      ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: MyInputField(
                      title: "End Time" ,
                      hint:  _endTime,
                      widget: IconButton(
                        onPressed: (){
                          _getTimeFromUser(isStartTime:false);
                        },
                        icon: Icon(Icons.access_time_rounded),
                        color:Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                title: "Remind",
                hint: "$_selectedRemind minutes early",
                widget: DropdownButton(
                  icon:Icon(Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0,),
                  onChanged: (String? newValue){
                    setState((){
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value){
                    return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString())
                    );
                  }
                  ).toList(),
                ),
              ),

              MyInputField(
                title: "Repeat",
                hint: "$_selectedRepeat",
                widget: DropdownButton(
                  icon:Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0,),
                  onChanged: (String? newValue){
                    setState((){
                      _selectedRepeat = newValue!;
                    });
                  },
                  items: repeatList.map<DropdownMenuItem<String>>((String? value){
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!, style: TextStyle(color:Colors.grey))
                    );
                  }
                  ).toList(),
                ),
              ),

              SizedBox(height: 18,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Color",
                    style: titleStyle,
                  ),
                  SizedBox(height: 8.0,),
                  Wrap(
                    children: List<Widget>.generate(
                        3,
                            (int index) {
                          return GestureDetector(
                            onTap: (){
                              setState((){
                                _selectedColor = index;
                                btnColor = index==0?Colors.blue:index==1?Colors.amber:Colors.lightGreen;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: index==0?Colors.blue:index==1?Colors.amberAccent:Colors.lightGreen,
                                child: _selectedColor == index? Icon(Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                ):Container(),
                              ),
                            ),
                          );

                        }
                    ),
                  )
                ],
              ),
                   GestureDetector(
                     onTap: (){
                       _validateDate();
                     },
                     child: Container(
                       width: 120,
                       height: 60,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: btnColor
                       ),
                       child: Center(
                         child: Text(
                           'Create Event',
                             style:TextStyle(
                                 color: Colors.white
                    )
                ),
              ),
            ),
          ),
                ],
              )



            ],
          ),
        ),
      ),
    );
  }

  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
          style: titleStyle,
        ),
        SizedBox(height: 8.0,),
        Wrap(
          children: List<Widget>.generate(
              3,
                  (int index) {
                return GestureDetector(
                  onTap: (){
                    setState((){
                      _selectedColor = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0?Colors.blue:index==1?Colors.amber:Colors.lightGreen,
                      child: _selectedColor == index? Icon(Icons.done,
                        color: Colors.white,
                        size: 16,
                      ):Container(),
                    ),
                  ),
                );

              }
          ),
        )
      ],
    );

  }

  _validateDate() {
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    } else if(_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black54,
        icon: Icon(Icons.warning_amber_outlined,
        color: Colors.black54
        ),
        borderRadius: 12,
        duration: const Duration(seconds: 2),
        borderWidth: 1,
        borderColor: Colors.black,
        maxWidth: 1000,
      );
    }
  }

  _addTaskToDb() async {
    int value  = await _taskController.addTask(
        task: Task(
          note: _noteController.text,
          title: _titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          remind: _selectedRemind,
          repeat: _selectedRepeat,
          color: _selectedColor,
          isCompleted: 0,
        )
    );
    print("My id is + $value");
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2122),
    );

    if(_pickerDate!=null){
      setState((){_selectedDate = _pickerDate;});
    }
  }

  _getTimeFromUser({required bool isStartTime})  async {
    var pickedTime = await _showTimerPicker();
    String _formattedTime = pickedTime.format(context);
    if(pickedTime==null){
      showSnackBar(context, "Time Cancelled");
    } else if(isStartTime==true){
      setState((){
        _startTime = _formattedTime;
      });
    }else if(isStartTime==false){
      setState((){
        _endTime = _formattedTime;
      });
    }
  }

  _showTimerPicker(){

    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }

}
