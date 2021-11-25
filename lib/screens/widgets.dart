import 'dart:ui';

import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  TaskCardWidget({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(Untitled)",
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              desc ?? "No Description",
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF868290),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          )
        ],
        color: Colors.white,
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String? text;
  bool isDone;

  TodoWidget(this.text, this.isDone);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isDone = !isDone;
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: isDone ? Colors.blue[900] : Colors.transparent,
                  border: isDone
                      ? null
                      : Border.all(color: Color(0xFF868290), width: 1.5)),
              child: Image(
                image: AssetImage("assets/images/check_icon.png"),
              ),
            ),
            Text(text ?? "(Unnamed Subtask)",
                style: TextStyle(
                    color: isDone ? Colors.blue[900] : Color(0xFF868290),
                    fontSize: 16,
                    fontWeight: isDone ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

class ScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
