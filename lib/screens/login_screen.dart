import 'package:car_uber/widgets/network_check.dart';
import 'package:car_uber/screens/home_page.dart';
import 'package:car_uber/screens/global/global_variable.dart';
import 'package:car_uber/screens/signup_screen.dart';
import 'package:car_uber/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passtextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

//checking internet available in the system
  checkIfNetworkisAvaliable() {
    // cMethods.checkConnectivity(context);

    signinFormValidation();
  }

//validation of signup
  signinFormValidation() {
    if (emailtextEditingController.text.trim().length < 3) {
      cMethods.DisplaySnackBar("Please write valid email", context);
    } else if (passtextEditingController.text.trim().length < 10) {
      cMethods.DisplaySnackBar("Please write valid password", context);
    } else {
      signinuser();
    }
  }

//using loader
  signinuser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          LoadingDailog(messageText: "Allowing you to login..."),
    );

//setup firebase and fecting the user email and password
    final User? userFirebase = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(
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

    if (userFirebase != null) {
      //call the user data
      DatabaseReference usersRef = FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(userFirebase.uid);
      usersRef.once().then((snap) {
        if (snap.snapshot.value != null) {
          if ((snap.snapshot.value as Map)["blockStatus"] == 'no') {
            userName = (snap.snapshot.value as Map)["name"];
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => HomePage()));
          } else {
            FirebaseAuth.instance.signOut();
            cMethods.DisplaySnackBar(
                'Your are blocked.Contact admin: sushanthdevadiga034@gmail.com',
                context);
          }
        } else {
          FirebaseAuth.instance.signOut();
          cMethods.DisplaySnackBar(
              'Your record do not exists as a User.', context);
        }
      });
    }
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
              "Login as a User",
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
                    height: 22,
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
                    height: 42,
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
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => SignUpScreen()));
                      },
                      child: Text(
                        "Don't have an Account? Register Here",
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
