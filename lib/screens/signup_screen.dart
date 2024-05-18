import 'package:car_uber/widgets/network_check.dart';
import 'package:car_uber/screens/home_page.dart';

import 'package:car_uber/screens/login_screen.dart';
import 'package:car_uber/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usertextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passtextEditingController = TextEditingController();
  TextEditingController phonetextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  checkIfNetworkisAvaliable() {
    cMethods.checkConnectivity(context);

    signUpFormValidation();
  }

  signUpFormValidation() {
    if (usertextEditingController.text.trim().length < 3) {
      cMethods.DisplaySnackBar(
          "Your name muat be alteast 4 or more characters.", context);
    } else if (phonetextEditingController.text.trim().length < 10) {
      cMethods.DisplaySnackBar("Your Phone number must be 10 numbers", context);
      // } else if (emailtextEditingController.text.contains('@')) {
      //   cMethods.DisplaySnackBar("Please write valid Email", context);
    } else if (passtextEditingController.text.trim().length < 6) {
      cMethods.DisplaySnackBar("Your password must be 6 characters", context);
    } else {
      registerNewUser();
    }
  }

  registerNewUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDailog(messageText: "Registering your account..."),
    );

    final User? userFirebase = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: emailtextEditingController.text.trim(),
      password: passtextEditingController.text.trim(),
    )
            .catchError((errorMsg) {
      Navigator.pop(context);
      cMethods.DisplaySnackBar(errorMsg.toString(), context);
    }))
        .user;
    if (!context.mounted) return;
    Navigator.pop(context);
    DatabaseReference usersRef =
        FirebaseDatabase.instance.ref().child("users").child(userFirebase!.uid);
    Map userDataMap = {
      "name": usertextEditingController.text.trim(),
      "email": emailtextEditingController.text.trim(),
      "phone": phonetextEditingController.text.trim(),
      "id": userFirebase.uid,
      "blockStatus": "no",
    };
    usersRef.set(userDataMap);

    Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset("assets/images/drive.png"),
            Text(
              "Create a Users's Account",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                children: [
                  TextField(
                    controller: usertextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        )),
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: phonetextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "User Phone",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        )),
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: emailtextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        )),
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    controller: passtextEditingController,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        )),
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        checkIfNetworkisAvaliable();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 81, 177, 91),
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20)),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => LoginScreen()));
                      },
                      child: Text(
                        "Already have an Account? Login Here",
                        style: TextStyle(color: Colors.blueGrey),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
