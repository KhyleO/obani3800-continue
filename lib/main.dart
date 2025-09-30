import 'package:banking/03_project_abc/05_login_form.dart';
import 'package:banking/04_data_models/modules/useraccount_profile.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MainFormABC());
// }

void main() {
  runApp(
      const MaterialApp(
        home: UserAccountForm04(),
        debugShowCheckedModeBanner: false,
      )
  );
}