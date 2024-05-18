import 'package:car_uber/screens/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  CarouselScreen({Key? key}) : super(key: key);

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            const Text(
              "PlugTrack",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 43,
                color: Color.fromARGB(255, 81, 177, 91),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Find electric charging points effortlessly",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            //  SizedBox(height: 10),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 450.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 100),
                  viewportFraction: 0.8,
                ),
                items: [
                  'assets/images/car10.jpeg',
                  'assets/images/car8.jpeg',
                  'assets/images/car9.jpeg',
                  'assets/images/car6.jpeg',
                  'assets/images/car2.jpeg',
                  'assets/images/car7.jpeg',
                  'assets/images/car4.jpeg',
                  'assets/images/car3.jpeg',
                  'assets/images/car1.jpeg',
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 0),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => LoginScreen()));
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: Color.fromARGB(255, 81, 177, 91),
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 81, 177, 91),
                    ),
                  )),
              // child: ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (c) =>  LoginScreen()));
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(255, 81, 177, 91),
              //     padding:  EdgeInsets.symmetric(
              //       horizontal: 100,
              //       vertical: 20,
              //     ),
              //   ),
              //   child:  Text(
              //     "Next",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
