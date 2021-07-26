import 'package:flutter/material.dart';

import './module/local_auth.dart';
import './widgets/home_page.dart';

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
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3CE52),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Text(
                    "Fingrtprint Auth",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Athunticate"),
                    onPressed: () async {
                      if (await LocalAuth.authenticate()) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {}
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
