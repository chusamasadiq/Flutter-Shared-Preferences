import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const SharedPref());
}

class SharedPref extends StatelessWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
