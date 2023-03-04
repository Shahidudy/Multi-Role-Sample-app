import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefproject/screens/admin_screen.dart';
import 'package:sharedprefproject/screens/home_screen.dart';
import 'package:sharedprefproject/screens/student_screen.dart';
import 'package:sharedprefproject/screens/teacher_screen.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Signup> {
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login Screen")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "STUDENT LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    //if i change next line as userType, screen will navigate to multiple screen
                    sp.setString("userType", 'teacher');
                    // sp.setString("userType", 'student');
                    // sp.setString("userType", 'admin');

                    sp.setString("email", emailController.text.toString());
                    sp.setString("age", ageController.text.toString());
                    sp.setString(
                        "password", passwordController.text.toString());
                    sp.setBool("isLogin", true);
                    if (sp.getString("userType") == 'teacher') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TeacherScreen(),
                        ),
                      );
                    } else if (sp.getString("userType") == 'student') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StudentScreen(),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdminScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreen),
                    child: Center(
                      child: Text(
                        "Signup",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
