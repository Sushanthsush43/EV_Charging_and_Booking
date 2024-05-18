import 'package:car_uber/firebase_options.dart';
import 'package:car_uber/screens/carousel_screen.dart';
import 'package:car_uber/screens/login_screen.dart';
// import 'package:car_uber/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //asking the user location in app
  await Permission.locationWhenInUse.isDenied.then((valueofPermission) {
    if (valueofPermission) {
      Permission.locationWhenInUse.request();
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        home: CarouselScreen());
  }
}
