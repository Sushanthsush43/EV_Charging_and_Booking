import 'package:car_uber/bottomNavigation_pages/my_vehicle_page.dart';
import 'package:car_uber/bottomNavigation_pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:car_uber/widgets/Map_page.dart'; // Import your MapPage widget

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //creating the electric car advertisment-------------
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/tesla.png",
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // const Text(
                        //   "",
                        //   style: TextStyle(color: Colors.white, fontSize: 15),
                        // ),
                        const SizedBox(height: 160),
                        Padding(
                          padding: const EdgeInsets.only(right: 259),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (C) => ShopPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white70,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Row(
                                children: [
                                  const Text(
                                    'Book Now ',
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 11,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //Defining the icons in row format------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.amberAccent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/testride.png',
                            width: 80,
                            height: 90,
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Test Ride',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.amberAccent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/plantrip.png',
                            width: 80,
                            height: 90,
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Plan a Trip',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.amberAccent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/referall.png',
                            width: 80,
                            height: 90,
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Refer & Earn',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.amberAccent,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/sub.png',
                            width: 80,
                            height: 90,
                          ),
                          const SizedBox(height: 0),
                          const Text(
                            'Subscription',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Icon(
                    Icons.battery_charging_full,
                    color: Color.fromARGB(255, 81, 177, 91),
                  ),
                  Text(
                    "Find Charging Stations",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 6,
            ),

            //Map Click page Navigator-----------------------------
            SizedBox(
              child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (c) => Map_Page()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/loc.png"),
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 81, 177, 91),
                          )),
                      width: MediaQuery.of(context).size.width / 1,
                      height: 260,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
