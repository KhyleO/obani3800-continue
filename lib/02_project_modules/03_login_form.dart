import 'package:banking/screens.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Form",
      home: LoginFormApp(),
    );
  }
}

class LoginFormApp extends StatefulWidget {
  @override
  _LoginFormAppState createState() => _LoginFormAppState();
}

class _LoginFormAppState extends State<LoginFormApp> {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String message = "";

  String usernameValid = "hello123";
  String passwordValid = "world456";

  bool isLoggedIn = false; // Flag to track login status

  void loginValidate() {
    String username = usernameCtrl.text;
    String password = passwordCtrl.text;

    setState(() {
      if (username == usernameValid && password == passwordValid) {
        message = "Welcome, $username!";
        isLoggedIn = true; // Set the login status to true on success
      } else {
        message = "Invalid Login";
        isLoggedIn = false; // Set the login status to false on failure
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Form",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(
                labelText: 'Enter Username',
                hintText: "hello123",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                labelText: 'Enter Password',
                hintText: "world456",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 90,
              width: 90,
              child: ElevatedButton(
                onPressed: loginValidate,
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color:
                message.startsWith("Welcome") ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,

      // Conditionally hide BottomNavigationBar if not logged in
      bottomNavigationBar: isLoggedIn
          ? BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
        ],
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ScreensTab()),
            );
          }
        },
      )
          : null, // No BottomNavigationBar when not logged in
    );
  }
}
