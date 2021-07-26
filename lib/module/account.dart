class Account {
  String accoName, userName, password, userEmail;
  num contact;
  Account(this.accoName, this.userName, this.password, this.userEmail,
      this.contact);

  // String get accoName => accoName;
  // String get userName => userName;
  // String get password => password;
  // String get userEmail => userEmail;
  // num get contact => contact;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['AccountName'] = accoName;
    map['UserName'] = userName;
    map['Password'] = password;
    map['Email'] = userEmail;
    map['Contact'] = contact;

    return map;
  }

  Account.fromMap(Map<String, dynamic> map) {
    this.accoName = map['AccountName'];
    this.userName = map['UserName'];
    this.password = map['Password'];
    this.userEmail = map['Email'];
    this.contact = map['Contact'];
  }
}
