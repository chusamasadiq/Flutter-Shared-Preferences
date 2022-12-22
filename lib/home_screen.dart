import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '';
  String password = '';
  String userType = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email') ?? '';
    password = sharedPreferences.getString('password') ?? '';
    userType = sharedPreferences.getString('userType') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Password: $password',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
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
                    sharedPreferences.clear();
                    Navigator.pop(context);
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
