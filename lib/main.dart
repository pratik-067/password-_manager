import 'package:flutter/material.dart';
import './widgets/add_account.dart';

import './widgets/creat_pwd.dart';

void main(List<String> args) {
  runApp(PassManager());
}

class PassManager extends StatefulWidget {
  _PassManagerState createState() => _PassManagerState();
}

class _PassManagerState extends State<PassManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Password Manager",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("My Password"),
        actions: [
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: null),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddAccount()));
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 15, 15),
            padding: EdgeInsets.all(12),
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: Colors.lightBlue),
            child: Card(
              child: TextButton(
                child: Text(
                  "Password generate",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreatePWD()));
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 15, 15),
            padding: EdgeInsets.all(12),
            width: 150,
            height: 150,
            child: Card(
              child: TextButton(
                child: Text(
                  "My Accounts",
                  textAlign: TextAlign.center,
                ),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
