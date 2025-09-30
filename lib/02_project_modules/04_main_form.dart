import 'package:banking/02_project_modules/03_login_form.dart';
import 'package:banking/screens.dart';
import 'package:flutter/material.dart';

class MainForm extends StatelessWidget {
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
  @override
  State<MainFormApp> createState() => _MainFormAppState();
}

enum AccountType { savings, current, fixedDeposit, joint }
enum ContactType { email, sms, phonecall, messenger, viber }

class _MainFormAppState extends State<MainFormApp> {
  final _formKey = GlobalKey<FormState>();

  final accountNumCtrl = TextEditingController();
  final accountNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  final Map<String, bool> services = {
    'Online Banking:': false,
    'Mobile Banking:': false,
    'ATM/Debit:': false,
    'Credit Card:': false,
    'Loan Services:': false,
    'Investment Services:': false,
  };

  final Map<String, bool> features = {
    'Email Notifcation': false,
    'SMS Notifcation': false,
    'Phone Call': false,
    'Messenger Notifcation': false,
    'Viber Notification': false,
  };

  AccountType? selectedAccountType = AccountType.savings;
  ContactType? selectedContactType = ContactType.email;

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
      map.entries.where((e) => e.value).map((e) => e.key).toList();

  String _accountTypeLabel(AccountType? t) {
    switch (t) {
      case AccountType.savings:
        return 'Savings Account';
      case AccountType.current:
        return 'Savings Account';
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
      case ContactType.phonecall:
        return 'Phone Call';
      case ContactType.messenger:
        return 'Messenger';
      default:
        return '_';
    }
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;
    final selectedServices = _selected(services);
    final selectedFeatures = _selected(features);

    final summary = StringBuffer()
      ..writeln("--- Banking System Form ---")
      ..writeln("Account Number: ${accountNumCtrl.text}")
      ..writeln("Account Name: ${accountNameCtrl.text}")
      ..writeln("Email: ${emailCtrl.text}")
      ..writeln("Phone: ${phoneCtrl.text}")
      ..writeln("Address: ${addressCtrl.text}")
      ..writeln("Account Type: ${_accountTypeLabel(selectedAccountType)}")
      ..writeln("Contact Type: ${_contactTypeLabel(selectedContactType)}")
      ..writeln("Services: ${selectedServices.join(', ')}")
      ..writeln("Services: ${selectedFeatures.join(', ')}");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Summary"),
        content: SingleChildScrollView(child: Text(summary.toString())),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, {String? hint}) =>
      InputDecoration(
          labelText: label, hintText: hint, border: OutlineInputBorder());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Banking System Form",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [

  // ----- Profile -----
              Text("Profile",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: accountNumCtrl,
                  decoration: _buildInputDecoration(
                      "Account Number",
                      hint: "0011223344"),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: accountNameCtrl,
                decoration: _buildInputDecoration(
                    "Full Name",
                    hint: "John Doe"),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: emailCtrl,
                decoration: _buildInputDecoration(
                    "Email Address",
                    hint: ""),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: phoneCtrl,
                decoration: _buildInputDecoration(
                    "Phone Number",
                    hint: "0011223344"),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(
                height: 15,
              ),

              TextFormField(
                controller: addressCtrl,
                decoration: _buildInputDecoration('Address'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Please enter address' : null,
                maxLines: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 20,
              ),


  // ----- Account Type -----
              Text("Account Type",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Column(
                children: [
                  RadioListTile<AccountType>(
                    title: Text("Savings Account"),
                    value: AccountType.savings,
                    groupValue: selectedAccountType,
                    onChanged: (v) => setState(() => selectedAccountType = v),
                  ),

                  RadioListTile<AccountType>(
                    title: Text("Current Account"),
                    value: AccountType.current,
                    groupValue: selectedAccountType,
                    onChanged: (v) => setState(() => selectedAccountType = v),
                  ),

                  RadioListTile<AccountType>(
                    title: Text("Fixed Account"),
                    value: AccountType.fixedDeposit,
                    groupValue: selectedAccountType,
                    onChanged: (v) => setState(() => selectedAccountType = v),
                  ),

                  RadioListTile<AccountType>(
                    title: Text("Joint Account"),
                    value: AccountType.joint,
                    groupValue: selectedAccountType,
                    onChanged: (v) => setState(() => selectedAccountType = v),
                  ),
                  const SizedBox(
                    height: 20,
                  ),


  // ----- Contact Type -----
                  Text("Preferred Communication Method",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  RadioListTile<ContactType>(
                    title: Text("Email"),
                    value: ContactType.email,
                    groupValue: selectedContactType,
                    onChanged: (v) => setState(() => selectedContactType = v)
                  ),

                  RadioListTile<ContactType>(
                    title: Text("SMS"),
                    value: ContactType.sms,
                    groupValue: selectedContactType,
                    onChanged: (v) => setState(() => selectedContactType = v),
                  ),

                  RadioListTile<ContactType>(
                    title: Text("Phone Call"),
                    value: ContactType.phonecall,
                    groupValue: selectedContactType,
                    onChanged: (v) => setState(() => selectedContactType = v),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

  // ----- Services Required -----
                  Text("Services Required",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  ...services.keys.map(
                      (k) => CheckboxListTile(
                        title: Text(k),
                        value: services[k],
                        onChanged: (v) => setState(() => services[k] = v ?? false),
                      ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

  // ----- Account Features -----
                  Text("Account Features",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  ...features.keys.map(
                      (k) => CheckboxListTile(
                        title: Text(k),
                        value: features[k],
                        onChanged: (v) => setState(() => features[k] = v ?? false),
                      ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

  // ----- Security & Preferences -----
                  Text("Security & Preferences",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  
                  SwitchListTile(
                    title: const Text("Activate Online Transactions"),
                    value: onlineTxns,
                    onChanged: (v) => setState(() => onlineTxns = v),
                  ),

                  SwitchListTile(
                    title: const Text("Enable Two-Factor Authentication"),
                    value: onlineTxns,
                    onChanged: (v) => setState(() => twoFA = v),
                  ),

                  SwitchListTile(
                    title: const Text("Allow International Transactions"),
                    value: onlineTxns,
                    onChanged: (v) => setState(() => intTxns = v),
                  ),

                  SwitchListTile(
                    title: const Text("Enable Auto-Debit for Bills"),
                    value: onlineTxns,
                    onChanged: (v) => setState(() => autoDebit = v),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  
                  
  // ----- Submit Button -----
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check_circle),
                      label: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Text("Submit"),
                      ),
                        onPressed: _submitForm,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  
                  
                  
                ],
              )




            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
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
          )
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ScreensTab()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginForm()),
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
