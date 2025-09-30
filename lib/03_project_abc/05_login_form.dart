import 'package:banking/03_project_abc/06_main_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginFormABC extends StatelessWidget {
  const LoginFormABC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Form",
      home: const SafeArea(child: LoginFormABCApp()),
    );
  }
}

class LoginFormABCApp extends StatefulWidget {
  const LoginFormABCApp({super.key});

  @override
  _LoginFormABCAppState createState() => _LoginFormABCAppState();
}

class _LoginFormABCAppState extends State<LoginFormABCApp> {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String message = "";
  Color messageColor = Colors.red;

  String usernameValid = "client01";
  String passwordValid = "pass0123";

  void loginValidate() {
    String username = usernameCtrl.text;
    String password = passwordCtrl.text;

    setState(() {
      if (username == usernameValid && password == passwordValid) {
        message = " \u2714 Login Successful! Welcome $username!";
        messageColor = Colors.blue;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Successful, Welcome $username!"),
            duration: Duration(seconds: 2),
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainFormABC()),
          );
        });
      } else {
        message = " \u2716 Invalid Username or Password";
        messageColor = Colors.red;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid Username or Password"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.yellow,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Row(
          children: [
            Image.asset(
              'images/abcbanklogo.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Text(
              'Your Money. Your Future',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
                color: Colors.blue[800],
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.grey.shade700,
                    offset: const Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/abcbanklogo.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20,),

              Container(
                height: 50,
                width: 400,
                child: TextField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(
                    labelText: "Enter username",
                    hintText: "client01",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blue.shade800,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              Container(
                height: 50,
                width: 400,
                child: TextField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter password",
                    hintText: "pass0123",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Colors.blue.shade800,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Colors.yellow,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),


              SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton(
                  onPressed: loginValidate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                message,
                style: TextStyle(
                  color: messageColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}