import 'package:banking/03_project_abc/00_%20home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class MainFormABC extends StatelessWidget {
  const MainFormABC({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: MainFormABCFormApp());
  }
}

class MainFormABCFormApp extends StatefulWidget {
  const MainFormABCFormApp({super.key});

  @override
  State<MainFormABCFormApp> createState() => _MainFormABCFormAppState();
}

class _MainFormABCFormAppState extends State<MainFormABCFormApp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userIdCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  bool isActive = false;
  late DateTime createdAt;

  @override
  void initState() {
    super.initState();
    createdAt = DateTime.now();
  }

  @override
  void dispose() {
    userIdCtrl.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final passwordHash = sha256.convert(utf8.encode(passwordCtrl.text.trim())).toString();

    ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Row(
    //       children: [
    //         Column(
    //           children: [
    //             Text(
    //               "User Saved:\n"
    //                   "ID: \n"
    //                   "Username: \n"
    //                   "Password: \n"
    //                   "Confirm Password: \n"
    //                   "Password Hash: \n"
    //                   "Active: \n"
    //                   "Created At: \n",
    //               style: TextStyle(
    //                   color: Colors.black
    //               ),
    //             ),
    //           ],
    //         ),
    //         Expanded(
    //           child: Column(
    //             children: [
    //               Text(
    //                 "\n"
    //                     "${userIdCtrl.text}\n"
    //                     "${usernameCtrl.text}\n"
    //                     "${passwordCtrl.text}\n"
    //                     "${confirmPasswordCtrl.text}\n"
    //                     "${passwordHash}\n"
    //                     "${isActive}\n"
    //                     "${createdAt}\n",
    //                 style: TextStyle(
    //                   color: Colors.black
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //
    //     backgroundColor: Colors.yellow,
    //     behavior: SnackBarBehavior.fixed,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    //   ),
    // );


    SnackBar(
      content: Table(
        columnWidths: const {
          0: IntrinsicColumnWidth(),
          1: FixedColumnWidth(50),
          2: FlexColumnWidth(),
        },
        children: [
          TableRow(children: [
            const Text("ID:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text(userIdCtrl.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
          TableRow(children: [
            const Text("Username:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text(usernameCtrl.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
          TableRow(children: [
            const Text("Password:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text(passwordCtrl.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),), // hide actual
          ]),
          TableRow(children: [
            const Text("Confirm Password:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text(confirmPasswordCtrl.text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
          TableRow(children: [
            const Text("Password Hash:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text(passwordHash, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
          TableRow(children: [
            const Text("Active:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text("$isActive", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
          TableRow(children: [
            const Text("Created At:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(),
            Text("$createdAt", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          ]),
        ],
      ),
      backgroundColor: Colors.blue.shade800,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      )
    );


  }

  void _reset() {
    _formKey.currentState?.reset();
    userIdCtrl.clear();
    usernameCtrl.clear();
    passwordCtrl.clear();
    confirmPasswordCtrl.clear();
    setState(() {
      isActive = true;
      createdAt = DateTime.now();
    });
  }

  InputDecoration _buildInputDecoration(String label) =>
      InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
        ),
      );

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("USER ACCOUNT", style: TextStyle(fontWeight: FontWeight.bold),),
                TextFormField(
                  controller: userIdCtrl,
                  decoration: _buildInputDecoration('User ID'),
                  validator: (value) => value == null || value.isEmpty ? 'User ID required' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: usernameCtrl,
                  decoration: _buildInputDecoration('Username'),
                  validator: (value) => value == null || value.trim().isEmpty ? 'Username required' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: _buildInputDecoration('Password'),
                  validator: (value) => value == null || value.length < 6 ? 'Password must be at least 6 characters' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: confirmPasswordCtrl,
                  obscureText: true,
                  decoration: _buildInputDecoration('Confirm Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please confirm your password';
                    if (value != passwordCtrl.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 12),



                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue.shade800, width: 2,
                    ),
                  ),
                  child: SwitchListTile(
                    value: isActive,
                    onChanged: (val) => setState(() => isActive = val),
                    title: Text(
                      'Active Account',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    activeColor: Colors.yellow,
                    secondary: Icon(Icons.toggle_on, color: Colors.yellow),
                  ),
                ),
                const SizedBox(height: 12),



                Container(
                  decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.blue.shade800, width: 2,
                  ),
                ),
                  child: ListTile(
                    title: Text(
                      'Created At: $createdAt',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),



                // Row(
                //   children: [
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         onPressed: _save,
                //         icon: const Icon(Icons.save),
                //         label: const Text('Save'),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.yellow,
                //           foregroundColor: Colors.white,
                //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     Expanded(
                //       child: ElevatedButton.icon(
                //         onPressed: _reset,
                //         icon: const Icon(Icons.refresh_rounded),
                //         label: const Text('Reset'),
                //         style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.yellow,
                //           foregroundColor: Colors.white,
                //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),



                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton.icon(
                    onPressed: _save,
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(height: 12,),

                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton.icon(
                    onPressed: _reset,
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Reset'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
          //     MaterialPageRoute(builder: (_) => ()),
          //   );
          // }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage03()),
            );
          }
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