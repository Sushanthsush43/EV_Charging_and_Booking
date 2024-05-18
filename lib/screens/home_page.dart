import 'package:car_uber/bottomNavigation_pages/openAi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:car_uber/topNavigation_pages/userProfileNavBar.dart';
import 'package:car_uber/bottomNavigation_pages/chat_AI.dart';
import 'package:car_uber/bottomNavigation_pages/ScreenPage.dart';
import 'package:car_uber/bottomNavigation_pages/my_vehicle_page.dart';
import 'package:car_uber/bottomNavigation_pages/scan_page.dart';
import 'package:car_uber/bottomNavigation_pages/shop_page.dart';
import 'package:car_uber/topNavigation_pages/messagePage.dart';
import 'package:car_uber/topNavigation_pages/notificationPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    ScreenPage(),
    MyVehiclePage(),
    const ScanResultPage(
      scanResult: '',
    ),
    const ShopPage(),
    const SupoortAi(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: UserProfileNavBar(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarHeight: kToolbarHeight * 1,
          title: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/drive.png',
                  height: 45,
                  width: 45,
                ),
                const Expanded(
                  child: Text(
                    "PlugTrack",
                    style: TextStyle(
                        color: Color.fromARGB(255, 81, 177, 91),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => MessagePage()));
              },
              icon: const Icon(Icons.message_sharp,
                  color: Color.fromARGB(255, 4, 4, 4)),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => notificationsPage()));
              },
              icon: const Icon(Icons.notifications,
                  color: Color.fromARGB(255, 11, 11, 11)),
            ),
          ],
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.car_rental_outlined,
                  color: Color.fromARGB(255, 0, 0, 0)),
              label: 'My Vehicle',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 81, 177, 91),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.qr_code_scanner_outlined,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 50,
                ),
              ),
              label: 'Scan',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.store, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Shop',
              backgroundColor: Colors.white,
            ),
            const BottomNavigationBarItem(
              icon:
                  Icon(Icons.people_sharp, color: Color.fromARGB(255, 0, 0, 0)),
              label: 'Help Ai',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 81, 177, 91),
          onTap: (index) {
            if (index == 2) {
              scanQr(context);
            } else {
              setState(() {
                _selectedIndex = index;
              });
            }
          },
        ),
      ),
    );
  }

  Future<void> scanQr(BuildContext context) async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      debugPrint(barcodeScanRes);

      //navigate new page to display the result------------------------
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanResultPage(scanResult: barcodeScanRes),
        ),
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
