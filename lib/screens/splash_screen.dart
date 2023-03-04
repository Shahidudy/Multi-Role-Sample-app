import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefproject/screens/admin_screen.dart';
import 'package:sharedprefproject/screens/home_screen.dart';
import 'package:sharedprefproject/screens/signup_screen.dart';
import 'package:sharedprefproject/screens/student_screen.dart';
import 'package:sharedprefproject/screens/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Sample Project"),
        // ),
        body: Image.asset(
          "asset/images/b-3.jpeg",
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 5));

    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    String userType = sp.getString("userType") ?? "";

    if (isLogin) {
      if (userType == 'teacher') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => TeacherScreen(),
            ),
            (route) => false);
      } else if (userType == 'student') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => StudentScreen(),
            ),
            (route) => false);
      } else if (userType == 'admin') {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => AdminScreen(),
            ),
            (route) => false);
      }
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Signup()));
    }
  }
}
