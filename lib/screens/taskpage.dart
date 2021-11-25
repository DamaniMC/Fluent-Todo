import 'dart:ffi';

import 'package:fluent_todo/models/task.dart';
import 'package:fluent_todo/screens/database_helper.dart';
import 'package:fluent_todo/screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TaskPage extends StatefulWidget {
  Task? task;
  TaskPage({@required this.task});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String _title = "Untitled";
  String _desc = "No description";
  @override
  Widget build(BuildContext context) {
    // if (widget.task != null) {
    //   print("id: ${widget.task!.id}");
    // }
    if (widget.task != null) {
      _title = widget.task!.title!;
      _desc = widget.task!.description!;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 32, left: 24, right: 24),
          color: Theme.of(context).backgroundColor,
          width: double.infinity,
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () async {
                      DataBaseHelper dbHelper = DataBaseHelper();
                      if (widget.task == null) {
                        Task newTask = Task(
                          title: _title,
                          description: _desc,
                        );

                        await dbHelper.insertTask(newTask);
                      } else {
                        int _id = widget.task!.id!;
                        Task updatedTask = Task(
                          id: _id,
                          title: _title,
                          description: _desc,
                        );
                        await dbHelper.updateTask(updatedTask);
                      }

                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage("assets/images/back_arrow_icon.png"),
                      height: 27,
                      width: 27,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    onChanged: (value) async {
                      if (value != "") {
                        _title = value;
                      }
                      // if (value != "") {
                      //   DataBaseHelper dbHelper = DataBaseHelper();
                      //   Task newTask = Task(
                      //     title: value,
                      //   );

                      //   await dbHelper.insertTask(newTask);
                      // }
                    },
                    initialValue:
                        (widget.task != null) ? widget.task!.title : null,
                    decoration: InputDecoration(
                      hintText: (widget.task != null) ? null : "Enter Title...",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      if (value != "") {
                        _desc = value;
                      }
                    },
                    initialValue:
                        (widget.task != null) ? widget.task!.description : null,
                    decoration: InputDecoration(
                      hintText:
                          (widget.task != null) ? null : "Enter description...",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                //TodoWidget("Subtask", false),
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Container(
                    //       margin: EdgeInsets.only(right: 10),
                    //       width: 20,
                    //       height: 20,
                    //       child: Image(
                    //         image:
                    //             AssetImage("assets/images/add_icon_dark.png"),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: TextFormField(
                    //         keyboardType: TextInputType.multiline,
                    //         maxLines: null,
                    //         onFieldSubmitted: (value) {

                    //         },
                    //         initialValue: null,
                    //         decoration: InputDecoration(
                    //           hintText: "Enter a subtask...",
                    //           border: InputBorder.none,
                    //         ),
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ]),
              Positioned(
                child: GestureDetector(
                  onTap: () async {
                    DataBaseHelper dbHelper = DataBaseHelper();
                    if (widget.task != null) {
                      Task task = widget.task!;
                      await dbHelper.deleteTask(task.id!);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/images/delete_icon.png"),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[600],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                ),
                bottom: 0,
                right: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
