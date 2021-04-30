class Account {
  String accoName, userName, password, userEmail;
  num contact;
  Account(this.accoName, this.userName, this.password, this.userEmail,
      this.contact);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'acountName': accoName,
      'userName': userName,
      'password': password,
      'userEmail': userEmail,
      'userContact': contact,
    };
    return map;
  }

  Account.fromMap(Map<String, dynamic> map) {
    accoName = map['accountName'];
    userName = map['userName'];
    password = map['password'];
    userEmail = map['userEmail'];
    contact = map['userContact'];
  }
}
