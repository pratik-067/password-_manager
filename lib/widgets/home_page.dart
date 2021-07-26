import 'package:flutter/material.dart';

import '../widgets/add_account.dart';
import '../widgets/creat_pwd.dart';
import '../widgets/pass_list.dart';

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
                  "Accounts",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PassList()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
