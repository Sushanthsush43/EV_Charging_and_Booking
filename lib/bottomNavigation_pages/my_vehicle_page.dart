import 'dart:math';

import 'package:car_uber/inside_navigator_pages/myVechile_Add_screen.dart';
import 'package:flutter/material.dart';

class MyVehiclePage extends StatefulWidget {
  MyVehiclePage({Key? key}) : super(key: key);

  @override
  State<MyVehiclePage> createState() => _MyVehiclePageState();
}

class _MyVehiclePageState extends State<MyVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              "assets/images/vehicle.png",
              fit: BoxFit.cover,
              height: 320,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 30),
            child: Text(
                "Manage your vehicle at single place and share the vehicle with your friends and family in just two simple steps.",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 30),
            child: Text(
                "1.Unlock or more immersive erperience by adding your vehicle information!",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0, right: 20),
            child: Text("2.Share your vehicle with friends and family.",
                style: TextStyle(color: Colors.black, fontSize: 15)),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => MyVehicleAddPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 40),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_circle_outline_outlined,
                    color: Color.fromARGB(255, 81, 177, 91),
                    size: 30,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Add",
                      style: TextStyle(
                          color: Color.fromARGB(255, 81, 177, 91),
                          fontSize: 20)),
                ],
              ))
        ],
      ),
    );
  }
}
