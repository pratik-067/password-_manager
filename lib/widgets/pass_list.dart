import 'package:flutter/material.dart';
import '../module/account.dart';

// ignore: must_be_immutable
class PassList extends StatefulWidget {
  @override
  _PassListState createState() => _PassListState();
}

class _PassListState extends State<PassList> {
  List<Account> accounts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        child: ListView.builder(
            //add scrollable list
            itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    accounts[index].accoName,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    Text(accounts[index].userName),
                    Text(accounts[index].password),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
