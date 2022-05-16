import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Homepage.dart';
import 'Forgotpassword.dart';

class Signin extends StatelessWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signin(),
    );
  }
}

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Sign in to continue...',
              style: TextStyle(fontSize: 19, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'User Name',
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Example'),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'password',
              style: TextStyle(fontSize: 23, color: Colors.black),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter your password'),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: InkWell(
              onTap: gotohome,
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xfff96060)),
                  child: Text(
                    'Log in ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  gotohome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}
