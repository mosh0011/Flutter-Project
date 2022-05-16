import 'package:flutter/material.dart';
import 'package:flutter_application_1/CheckList.dart';
import 'package:flutter_application_1/Forgotpassword.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'package:flutter_application_1/Loginpage.dart';
import 'package:flutter_application_1/MyTask.dart';
import 'package:flutter_application_1/NewNote.dart';
import 'package:flutter_application_1/NewPass.dart';
import 'package:flutter_application_1/likes.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/menu.dart';
import 'package:flutter_application_1/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    MyTaskPage(),
    ProfilePage(),
    LikesPage(),
    MenuPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = mytask(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff96060),
        child: Icon(Icons.add),
        onPressed: () {
          openHome();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyTaskPage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle,
                          color:
                              currentTab == 0 ? Color(0xfff96060) : Colors.grey,
                        ),
                        Text(
                          'My task',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Color(0xfff96060)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MenuPage(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color:
                              currentTab == 1 ? Color(0xfff96060) : Colors.grey,
                        ),
                        Text(
                          'Notification',
                          style: TextStyle(
                            color: currentTab == 1
                                ? Color(0xfff96060)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            LikesPage(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color:
                              currentTab == 2 ? Color(0xfff96060) : Colors.grey,
                        ),
                        Text(
                          'Likes',
                          style: TextStyle(
                            color: currentTab == 2
                                ? Color(0xfff96060)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfilePage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          color:
                              currentTab == 3 ? Color(0xfff96060) : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Color(0xfff96060)
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  openHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
