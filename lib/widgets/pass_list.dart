import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../module/account.dart';
import '../database_helper.dart';

// ignore: must_be_immutable
class PassList extends StatefulWidget {
  @override
  _PassListState createState() => _PassListState();
}

class _PassListState extends State<PassList> {
  List<Account> accounts;
  int count = 0;
  DatabaseHelper databaseHelper = DatabaseHelper();
  void delAll() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    databaseHelper.deleteAll();
  }

  void getData() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Account>> accountListFuture = databaseHelper.getAccList();
      accountListFuture.then((accList) {
    
        setState(() {
          this.accounts = accList;
          this.count = accList.length;
        });
  
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (accounts == null) {
      accounts = List<Account>();
      getData();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: getData),
          IconButton(icon: Icon(Icons.delete), onPressed: delAll)
        ],
      ),
      body: getAccountListView(),
    );
  }

  ListView getAccountListView() {
    return ListView.builder(
        //add scrollable list
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    this.accounts[index].accoName,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    Text(this.accounts[index].userName),
                    Text(this.accounts[index].password),
                  ],
                )
              ],
            ),
          );
        });
  }
}
