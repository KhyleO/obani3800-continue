import 'package:banking/03_project_abc/06_main_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class HomePage03 extends StatelessWidget {
  const HomePage03({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: HomePage03FormApp(),);
  }
}

class HomePage03FormApp extends StatefulWidget {
  const HomePage03FormApp({super.key});

  @override
  State<HomePage03FormApp> createState() => _HomePage03State();
}

class _HomePage03State extends State<HomePage03FormApp> {
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
                fontFamily: 'Comics Sans',
                fontStyle: FontStyle.italic,
                letterSpacing: 2.0,
                color: Colors.blue[800],
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.grey.shade600,
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


      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: 400,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (builder) => const MainFormABC()),
                );
              },
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('???'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // if (index == 0) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (_) => ScreensTab()),
          //   );
          // }
          // else if (index == 1) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (_) => HomePage03()),
          //   );
          // }
          // else if (index == 2) {
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (_) => ()),
          //   // );
          // }
        },
      ),
    );
  }
}
