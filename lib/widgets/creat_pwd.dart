import 'package:flutter/material.dart';

import '../module/password_genrator.dart';

class CreatePWD extends StatefulWidget {
  @override
  _CreatePWDState createState() => _CreatePWDState();
}

class _CreatePWDState extends State<CreatePWD> {
  TextEditingController pwdLength = new TextEditingController();
  String pwd = "____";
  void get() async {
    pwd = await PasswordGenrator().genrate(int.parse(pwdLength.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Password Genrator",
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.copy_rounded,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: EdgeInsetsGeometry.infinity.horizontal,
            height: 150,
            child: Card(
                shadowColor: Colors.grey,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    pwd,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Row(children: [
            Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.only(left: 20, right: 50),
              child: TextField(
                controller: pwdLength,
                decoration: InputDecoration(
                  labelText: "length",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            RaisedButton(
                child: Text("Genrate"), color: Colors.blue, onPressed: get)
          ]),
        ],
      ),
    );
  }
}
