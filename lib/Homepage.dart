import 'package:flutter/material.dart';
import 'package:flutter_application_1/CheckList.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Loginpage.dart';
import 'package:flutter_application_1/NewNote.dart';
import 'package:flutter_application_1/NewTask.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'CheckList.dart';
import 'NewNote.dart';
import 'NewTask.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String filterType = 'today';
  DateTime today = new DateTime.now();
  var monthNames = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEPT',
    'OCT',
    'NOV',
    'DEC'
  ];
  String taskpop = 'close';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Color(0xfff96060),
                elevation: 0,
                title: Text(
                  'Work list',
                  style: TextStyle(fontSize: 20),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changefilter('today');
                          },
                          child: Text(
                            'Today',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == 'today')
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changefilter('monthly');
                          },
                          child: Text(
                            'Monthly',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == 'monthly')
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    )
                  ],
                ),
              ),
              (filterType == 'monthly')
                  ? TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2010, 10, 20),
                      lastDay: DateTime.utc(2070, 10, 20))
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today ${monthNames[today.month - 1]},${today.day} / ${today.year} ",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      taskWidget(
                          Color(0xfff96060), 'Meeting with wael', '9:30 AM'),
                      taskWidget(Colors.amber, 'Eating breakfast', '9:30 AM'),
                      taskWidget(
                          Colors.blue, 'Go to the lecture 1', '10:30 AM'),
                      taskWidget(
                          Colors.green, 'Go to the lecture 2', '11:30 AM'),
                      taskWidget(Colors.grey, 'return to home', '12:30 PM'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xff292e4e),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      ),
                    ),
                    Positioned(
                      child: InkWell(
                        onTap: openTaskPop,
                        child: Center(
                          child: Text(
                            'Click to Add task',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: (taskpop == 'open')
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: InkWell(
                        onTap: closeTskPop,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              InkWell(
                                onTap: openNewTask,
                                child: Container(
                                    child: Text(
                                  'Add Task',
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openQuckNote,
                                child: Container(
                                    child: Text(
                                  'Add Quick Note',
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openCkecklist,
                                child: Container(
                                    child: Text(
                                  'Add Checklist',
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openHome,
                                child: Container(
                                    child: Text(
                                  'Go to Home page',
                                  style: TextStyle(fontSize: 18),
                                )),
                              ),
                              SizedBox(
                                height: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  openTaskPop() {
    taskpop = 'open';
    setState(() {});
  }

  closeTskPop() {
    taskpop = 'close';
    setState(() {});
  }

  changefilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]),
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 4)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey, fontSize: 17),
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            height: 50,
            width: 5,
            color: color,
          )
        ]),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.white,
          icon: Icons.edit,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: color,
          icon: Icons.delete,
          onTap: () {},
        )
      ],
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
    );
  }

  openNewTask() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewTask()));
  }

  openQuckNote() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote()));
  }

  openCkecklist() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CheckList()));
  }

  openlogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }

  openHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
