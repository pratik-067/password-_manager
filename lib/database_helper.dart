import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import './module/account.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // singleton databaseHelper
  static Database _database; //singaleton database

  static const String accountName = 'AccountName';
  static const String userName = 'UserName';
  static const String password = 'Password';
  static const String email = 'Email';
  static const String contact = 'Contact';
  static const String DB_NAME = "accounts.db";
  static const String TABLE = "Accounts";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    // get the directory path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + DB_NAME;

    //open /create Database at give path
    var dB = openDatabase(path, version: 1, onCreate: _createDb);
    return dB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $TABLE($accountName TEXT NOt NULL, $userName TEXT NOT NULL, $password TEXT NOT NULL , $email TEXT , $contact INTEGER ,PRIMARY KEY ($accountName,$userName))");
  }

// fetch opration
  Future<List<Map<String, dynamic>>> getAccountMaplist() async {
    Database db = await this.database;
    var result = await db.query(TABLE, orderBy: '$accountName ASC');
    return result;
  }

// Insert
  Future<int> insertAccount(Account acc) async {
    Database db = await this.database;
    var result = db.insert(TABLE, acc.toMap());

    return result;
  }

// Update
  Future<int> updateAccount(Account acc) async {
    Database db = await this.database;
    var result = db.update(TABLE, acc.toMap(),
        where: '$accountName = ? AND $userName = ?');
    return result;
  }

// Delete
  Future<int> deleteAccount(String accN, userN) async {
    Database db = await this.database;
    var result = db.rawDelete(
        'DELETE FROM $TABLE WHERE $accountName = $accN AND $userName = $userN');
    return result;
  }

  Future<int> deleteAll() async {
    Database db = await this.database;
    var result = db.rawDelete('DELETE FROM $TABLE');
    return result;
  }

  Future<List<Account>> getAccList() async {
    var accMapList = await getAccountMaplist();
    int count = accMapList.length;

    List<Account> accountList = List<Account>();
    for (int i = 0; i < count; i++) {
      accountList.add(Account.fromMap(accMapList[i]));

      print(accountList[i]);
    }
    // print(accountList);
    return accountList;
  }
}
