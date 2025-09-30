import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class UserAccountForm extends StatelessWidget {
  const UserAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: UserAccountFormApp());
  }
}

class UserAccountFormApp extends StatefulWidget {
  const UserAccountFormApp({super.key});

  @override
  State<UserAccountFormApp> createState() => _UserAccountFormAppState();
}

class _UserAccountFormAppState extends State<UserAccountFormApp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userIdCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();
  bool isActive = true;
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
      SnackBar(
        content: Text(
          "User Saved:\n"
              "ID: ${userIdCtrl.text}\n"
              "Username: ${usernameCtrl.text}\n"
              "Password: ********\n"
              "Confirm Password: ********\n"
              "Password Hash: $passwordHash\n"
              "Active: $isActive\n"
              "Created At: $createdAt",
        ),
        backgroundColor: Colors.teal[900],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
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
          borderSide: BorderSide(color: Colors.teal[900]!, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal[900]!, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal[200]!, width: 2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF004D40),
          statusBarIconBrightness: Brightness.light,
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.teal[900]!,
            width: 5,
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'images/abcbanklogo.png',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            const Text(
              'Your Money. Your Future',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: _reset,
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.save, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                SwitchListTile(
                  value: isActive,
                  onChanged: (val) => setState(() => isActive = val),
                  title: Text(
                    'Active Account',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                  activeColor: Colors.teal[900],
                  secondary: Icon(Icons.toggle_on, color: Colors.teal[900]),
                ),
                const SizedBox(height: 12),
                ListTile(
                  title: Text(
                    'Created At: $createdAt',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _save,
                        icon: const Icon(Icons.save),
                        label: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[900],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _reset,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Reset'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[900],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}