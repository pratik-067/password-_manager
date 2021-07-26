import 'package:flutter/material.dart';

import '../module/account.dart';
import 'home_page.dart';
import 'creat_pwd.dart';
import '../module/myencryption.dart';
import '../database_helper.dart';

// ignore: must_be_immutable
class AddAccount extends StatelessWidget {
  TextEditingController accountTextController = TextEditingController();
  TextEditingController userTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController contactTextController = TextEditingController();

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Account> acoList;
  int count = 0;

  void submit() {
    final enteracco = accountTextController.text;
    final entereduser = userTextController.text;
    final enteredpass = passTextController.text;
    String enteredEmail;
    num enteredCon;

    if (entereduser.isEmpty || enteredpass.isEmpty || enteracco.isEmpty) {
      return;
    } else {
      emailTextController.text.isNotEmpty
          ? enteredEmail = emailTextController.text
          : enteredEmail = null;
      contactTextController.text.isNotEmpty
          ? enteredCon = num.parse(contactTextController.text)
          : enteredCon = null;

      var result = Account(accountTextController.text, entereduser,
          MyEncryption.encrpteASE(enteredpass), enteredEmail, enteredCon);
      databaseHelper.insertAccount(result);
      print(result.accoName);
      print(result.userName);
      print(result.password);
      print(result.userEmail);
      print(result.contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: () {
                submit();
                Navigator.of(context)
                    .pop(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 9,
              ),
              TextField(
                controller: accountTextController,
                decoration: InputDecoration(
                  labelText: "Account name",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => submit(),
              ),
              SizedBox(
                height: 9,
              ),
              TextField(
                controller: userTextController,
                decoration: InputDecoration(
                  labelText: "User Name",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => submit(),
              ),
              SizedBox(
                height: 9,
              ),
              TextField(
                controller: passTextController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => submit(),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                      child: Text("Genrat one"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreatePWD()));
                      })),
              TextField(
                controller: emailTextController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSubmitted: (_) => submit(),
              ),
              SizedBox(
                height: 9,
              ),
              TextField(
                controller: contactTextController,
                decoration: InputDecoration(
                  labelText: "Contact",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                onSubmitted: (_) => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
