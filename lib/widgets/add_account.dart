import 'package:flutter/material.dart';

import '../module/account.dart';
import '../main.dart';
import 'creat_pwd.dart';

// ignore: must_be_immutable
class AddAccount extends StatelessWidget {
  TextEditingController accountTextController = TextEditingController();
  TextEditingController userTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController contactTextController = TextEditingController();

  void submit() {
    final entereduser = userTextController.text;
    final enteredpass = passTextController.text;
    if (entereduser.isEmpty || enteredpass.isEmpty) {
      return;
    }
    Account(accountTextController.text, entereduser, enteredpass,
        emailTextController.text, num.parse(contactTextController.text));
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
        padding: const EdgeInsets.all(8.0),
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CreatePWD()));
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
              keyboardType: TextInputType.number,
              maxLength: 10,
              onSubmitted: (_) => submit(),
            ),
          ],
        ),
      ),
    );
  }
}
