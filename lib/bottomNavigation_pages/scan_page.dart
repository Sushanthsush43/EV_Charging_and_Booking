import 'package:car_uber/bottomNavigation_pages/my_vehicle_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanResultPage extends StatelessWidget {
  final String scanResult;

  const ScanResultPage({Key? key, required this.scanResult}) : super(key: key);

// Widget build(BuildContext context){
//   if(scanResult.isEmpty){
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       Navigator.pop(context)
//     })
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 177, 91),
        title: const Text(
          'Scan Result',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/paypal.png",
              width: 300,
              height: 200,
              alignment: Alignment.center,
            ),
            Center(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 140, vertical: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: Color.fromARGB(255, 223, 209, 55))),
                  child: Text(
                    scanResult,
                    style:
                        const TextStyle(fontSize: 20, color: Colors.blueGrey),
                  )),
            ),
            SizedBox(
              height: 220,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                    backgroundColor: const Color.fromARGB(255, 81, 177, 91)),
                onPressed: () {},
                child: const Text("Pay ₹ 100.86",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
