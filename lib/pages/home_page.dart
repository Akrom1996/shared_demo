import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/model/user.dart';
import 'package:untitled2/services/Prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.text="JoneWilliams@gmail.com";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30,
                  bottom: 10,
                ),
                child: Image.asset(
                  "assets/images/img1.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              "Welcome back!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "Log in to your existant account of Q Allure",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            InputField(isName: true, controller: controller1),
            InputField(isName: false, controller: controller2),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 8),
              height: 50,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[700], shape: StadiumBorder()),
                onPressed: () async {
                  var user =
                      User.fromJson({"userName": controller1.text, "password": controller2.text});
                  Prefs.saveUser(user);
                  User userLoad = await Prefs.loadUser();
                  print(userLoad.userName);
                  print(userLoad.password);
                },
                child: Text(
                  "LOG IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "Or connect using",
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 130,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo[600]),
                        onPressed: () {},
                        child: Text("Facebook"),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 130,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[600]),
                        onPressed: () {},
                        child: Text("Google"),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final isName;
  final controller;
  const InputField({Key? key, this.isName, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 64,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      // padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TextFormField(
        // initialValue: isName ? "JoneWilliams@gmail.com" : null,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorHeight: 26,

        style: TextStyle(
            fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            hintText: isName ? "JoneWilliams@gmail.com" : "Password",
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(32)),
            prefixIcon: isName
                ? Icon(
                    Icons.person_outline_outlined,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.lock_outline,
                    color: Colors.blue,
                  )),
      ),
    );
  }
}
