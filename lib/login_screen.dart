import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xff303F4A),
                  ),
                  fillColor: const Color(0xffF8F9FA),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffe4e7eb),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffe4e7eb),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xff303F4A),
                  ),
                  fillColor: const Color(0xffF8F9FA),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffe4e7eb),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffe4e7eb),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('LOGIN'),
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString(
                        "email", emailController.text.toString());
                    sharedPreferences.setString(
                        "password", passwordController.text.toString());
                    if ((sharedPreferences.getString("email") == "usamasadiq163@gmail.com" && sharedPreferences.getString("password") == '1234')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
