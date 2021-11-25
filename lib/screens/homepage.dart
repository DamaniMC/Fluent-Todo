import 'package:fluent_todo/screens/database_helper.dart';
import 'package:fluent_todo/screens/taskpage.dart';
import 'package:fluent_todo/screens/widgets.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataBaseHelper dbHelper = DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    Color bc = Theme.of(context).backgroundColor;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          width: double.infinity,
          padding: EdgeInsets.only(top: 32, left: 24.0, right: 24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      initialData: [],
                      future: dbHelper.getTasks(),
                      builder: (context, AsyncSnapshot snapshot) {
                        return ScrollConfiguration(
                          behavior: ScrollBehaviour(),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskPage(
                                            task: snapshot.data[index])),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: TaskCardWidget(
                                  title: snapshot.data[index].title,
                                  desc: snapshot.data[index].description,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: IgnorePointer(
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).backgroundColor,
                          Theme.of(context).backgroundColor,
                          Theme.of(context).backgroundColor.withAlpha(0),
                        ],
                        end: FractionalOffset.bottomCenter,
                        begin: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: IgnorePointer(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).backgroundColor,
                          Theme.of(context).backgroundColor.withAlpha(0)
                        ],
                        end: FractionalOffset.topCenter,
                        begin: FractionalOffset.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskPage(task: null)),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/images/add_icon.png"),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[600],
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
