// import 'package:flutter/material.dart';
//
// class MainForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Banking System Form",
//       home: MainFormApp(),
//     );
//   }
// }
//
// class MainFormApp extends StatefulWidget {
//   @override
//   _MainFormAppState createState() => _MainFormAppState();
// }
//
// enum AccountType {savings, current, fixedDeposit, joint}
// enum ContactType {email, sms, phoneCall, messenger, viber}
//
//
//
// class _MainFormAppState extends State<MainFormApp> {
//   final _formKey = GlobalKey<FormState>();
//
//   final accountNumCtrl = TextEditingController();
//   final accountNameCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final phoneCtrl = TextEditingController();
//   final addressCtrl = TextEditingController();
//
//   final Map<String, bool> services = {
//     "Online Banking: ": false,
//     "Mobile Banking: ": false,
//     "ATM/DEBIT: ": false,
//     "Credit Card: ": false,
//     "Loan Services: ": false,
//     "Investment Services: ": false,
//   };
//
//   final Map<String, bool> features = {
//     "Email Notifications: ": false,
//     "SMS Notifications: ": false,
//     "Phone Call: ": false,
//     "Messenger Notifications: ": false,
//   };
//
//   AccountType? selectedAccountType = AccountType.savings;
//   ContactType? selectedContactType = ContactType.email;
//
//   bool onlineTxns = true;
//   bool twoFA = true;
//   bool intTxns = false;
//   bool autoDebit = false;
//
//
//
//   @override
//
//   void dispose() {
//     accountNumCtrl.dispose();
//     accountNameCtrl.dispose();
//     emailCtrl.dispose();
//     phoneCtrl.dispose();
//     addressCtrl.dispose();
//     super.dispose();
// }
//
//   List<String> _selected(Map<String, bool> map) =>
//       map.entries.where((e) => e.value).map((e) => e.key).toList();
//
//   String _accountTypeLabel(AccountType? t) {
//     switch (t) {
//       case AccountType.savings:
//         return "Savings Account";
//       case AccountType.current:
//         return "Current Account";
//       case AccountType.fixedDeposit:
//         return "Fixed Deposit Account";
//       case AccountType.joint:
//         return "Joint Account";
//       default:
//         return"_";
//     }
//   }
//
//   String _contactTypeLabel(ContactType? t) {
//     switch (t) {
//       case ContactType.email:
//         return "Savings Account";
//       case ContactType.sms:
//         return "Current Account";
//       case ContactType.messenger:
//         return "Fixed Deposit Account";
//       case ContactType.phoneCall:
//         return "Phone Call";
//       default:
//         return"_";
//     }
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate())
//       return;
//     final selectedServices = _selected(services);
//     final selectedFeatures = _selected(features);
//
//     final summary = StringBuffer()
//     ..writeln("Account Number: ${accountNumCtrl.text}")
//     ..writeln("Account Name: ${accountNameCtrl.text}")
//     ..writeln("Email: ${emailCtrl.text}")
//     ..writeln("Phone: ${phoneCtrl.text}")
//     ..writeln("Address: ${addressCtrl.text}")
//
//     .. writeln("Account Type: ${_accountTypeLabel(selectedAccountType)}")
//     .. writeln("Contact Type: ${_contactTypeLabel(selectedContactType)}")
//     .. writeln("Services: ${selectedFeatures.join(", ")}")
//     .. writeln("Features: ${selectedFeatures.join(", ")}");
//
//     showDialog(context: context,
//         builder: (_) => AlertDialog(
//           title: Text("Summary"),
//           content: SingleChildScrollView(
//             child: Text(summary.toString()),),
//           actions: [],
//         )
//     );
//   }
//
//   InputDecoration _buildInputDecoration(String label, {String? hint}) =>
//   InputDecoration(
//     labelText: label,
//     hintText: hint,
//     border: OutlineInputBorder(),
//   );
//
//
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Text("Banking System",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.green,
//       ),
//
//       body: Form(
//           child: ListView(
//             children: [
//               Text("Profile"),
//               TextField(
//                 controller: accountNumCtrl,
//               ),
//             ],
//           ),
//       ),
//
//       bottomNavigationBar: BottomNavigationBar(items: []),
//
//       backgroundColor: Color(0xFF90CAF9),
//     );
//   }
// }
//



import 'package:flutter/material.dart';

class MainForm2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Banking System Form",
      home: MainFormApp(),
    );
  }
}

class MainFormApp extends StatefulWidget {
  const MainFormApp({super.key});

  @override
  State<MainFormApp> createState() => _MainFormAppState();
}

enum AccountType { savings, current, fixedDeposit, joint }
enum ContactType { email, sms, phoneCall, messenger, viber }

class _MainFormAppState extends State<MainFormApp> {
  final _formKey = GlobalKey<FormState>();

  final accountNumCtrl = TextEditingController();
  final accountNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  final Map<String, bool> services = {
    'Online Banking': false,
    'Mobile Banking': false,
    'ATM/Debit': false,
    'Credit Card': false,
    'Loan Services': false,
    'Investment Services': false,
  };

  final Map<String, bool> features = {
    'Email Notification': false,
    'SMS Notification': false,
    'Phone Call': false,
    'Messenger Notification': false,
  };

  AccountType? selectedAccountType = AccountType.savings;
  ContactType? selectedContactType = ContactType.email;

// Switches
  bool onlineTxns = true;
  bool twoFA = true;
  bool intTxns = false;
  bool autoDebit = false;

  @override
  void dispose() {
    accountNumCtrl.dispose();
    accountNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();
    super.dispose();
  }

  List<String> _selected(Map<String, bool> map) =>
      map.entries.where((element) => element.value).map((e) => e.key).toList();

  String _accountTypeLabel(AccountType? t) {
    switch (t) {
      case AccountType.savings:
        return 'Savings Account';
      case AccountType.current:
        return 'Current Account';
      case AccountType.fixedDeposit:
        return 'Fixed Deposit Account';
      case AccountType.joint:
        return 'Joint Account';
      default:
        return '_';
    }
  }

  String _contactTypeLabel(ContactType? t) {
    switch (t) {
      case ContactType.email:
        return 'Email';
      case ContactType.sms:
        return 'SMS';
      case ContactType.messenger:
        return 'Messenger';
      case ContactType.phoneCall:
        return 'Phone Call';
      case ContactType.viber:
        return 'Viber';
      default:
        return '_';
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    final selectedServices = _selected(services);
    final selectedFeatures = _selected(features);

    final summary = StringBuffer()
      ..writeln("Account Number: ${accountNumCtrl.text}")
      ..writeln("Account Name: ${accountNameCtrl.text}")
      ..writeln("Email: ${emailCtrl.text}")
      ..writeln("Phone: ${phoneCtrl.text}")
      ..writeln("Address: ${addressCtrl.text}")
      ..writeln("Account Type: ${_accountTypeLabel(selectedAccountType)}")
      ..writeln("Contact Type: ${_contactTypeLabel(selectedContactType)}")
      ..writeln("Services: ${selectedServices.join(', ')}")
      ..writeln("Features: ${selectedFeatures.join(', ')}")
      ..writeln("Online Transactions: ${onlineTxns ? 'Yes' : 'No'}")
      ..writeln("Two Factor Authentication: ${twoFA ? 'Enabled' : 'Disabled'}")
      ..writeln("International Transactions: ${intTxns ? 'Yes' : 'No'}")
      ..writeln("Auto Debit: ${autoDebit ? 'Yes' : 'No'}");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Summary"),
        content: SingleChildScrollView(
          child: Text(summary.toString()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, {String? hint}) => InputDecoration(
    labelText: label,
    hintText: hint,
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banking System Form'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: accountNumCtrl,
                decoration: _buildInputDecoration('Account Number'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter account number' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: accountNameCtrl,
                decoration: _buildInputDecoration('Account Name'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter account name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailCtrl,
                decoration: _buildInputDecoration('Email'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter email' : null,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneCtrl,
                decoration: _buildInputDecoration('Phone Number'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter phone number' : null,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressCtrl,
                decoration: _buildInputDecoration('Address'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter address' : null,
                maxLines: 2,
              ),
              SizedBox(height: 20),

              Text('Account Type:', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<AccountType>(
                value: selectedAccountType,
                items: AccountType.values
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(_accountTypeLabel(e)),
                ))
                    .toList(),
                onChanged: (val) => setState(() => selectedAccountType = val),
                decoration: _buildInputDecoration('Select Account Type'),
              ),

              SizedBox(height: 20),

              Text('Preferred Contact Type:', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<ContactType>(
                value: selectedContactType,
                items: ContactType.values
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(_contactTypeLabel(e)),
                ))
                    .toList(),
                onChanged: (val) => setState(() => selectedContactType = val),
                decoration: _buildInputDecoration('Select Contact Type'),
              ),

              SizedBox(height: 20),

              Text('Services:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...services.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: services[key],
                  onChanged: (val) {
                    setState(() {
                      services[key] = val ?? false;
                    });
                  },
                );
              }).toList(),

              SizedBox(height: 20),

              Text('Features:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...features.keys.map((key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: features[key],
                  onChanged: (val) {
                    setState(() {
                      features[key] = val ?? false;
                    });
                  },
                );
              }).toList(),

              SizedBox(height: 20),

              Text('Security Settings:', style: TextStyle(fontWeight: FontWeight.bold)),
              SwitchListTile(
                title: Text('Online Transactions'),
                value: onlineTxns,
                onChanged: (val) => setState(() => onlineTxns = val),
              ),
              SwitchListTile(
                title: Text('Two Factor Authentication'),
                value: twoFA,
                onChanged: (val) => setState(() => twoFA = val),
              ),
              SwitchListTile(
                title: Text('International Transactions'),
                value: intTxns,
                onChanged: (val) => setState(() => intTxns = val),
              ),
              SwitchListTile(
                title: Text('Auto Debit'),
                value: autoDebit,
                onChanged: (val) => setState(() => autoDebit = val),
              ),

              SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


