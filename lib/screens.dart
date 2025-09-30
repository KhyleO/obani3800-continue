import 'package:banking/02_project_modules/03_login_form.dart';
import 'package:banking/02_project_modules/04_main_form.dart';
import 'package:banking/03_project_abc/05_login_form.dart';
import 'package:banking/03_project_abc/06_main_form.dart';
import 'package:flutter/material.dart';

class ScreensTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screens Tab",
      home: ScreensTabApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreensTabApp extends StatefulWidget {
  @override
  _ScreensTabAppState createState() => _ScreensTabAppState();
}

class _ScreensTabAppState extends State<ScreensTabApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Expanded(
        child: SingleChildScrollView(
          child: Container(
            height: 1000,
            width: 200,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Text(
                    "SCREENS LIST",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => LoginForm()));
                  },
                  child: Text("login_form.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MainForm()));
                  },
                  child: Text("main_form.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => LoginFormABC()));
                  },
                  child: Text("ABC_login.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MainFormABC()));
                  },
                  child: Text("ABC_mainform.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("???.dart"),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            color: Colors.greenAccent,
          ),
        ),
      ),

      backgroundColor: Color(0xFF00E676),
    );
  }
}
