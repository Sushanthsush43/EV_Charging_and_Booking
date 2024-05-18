import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyVehicleAddPage extends StatefulWidget {
  MyVehicleAddPage({Key? key}) : super(key: key);

  @override
  State<MyVehicleAddPage> createState() => _MyVehicleAddPageState();
}

class _MyVehicleAddPageState extends State<MyVehicleAddPage> {
  String? selectedVehicle;
  List<String> vehicleBrands = [
    'Toyota',
    'Honda',
    'Ford',
    'Chevrolet',
    'Volkswagen',
    'BMW',
    'Mercedes-Benz',
    'Audi',
    'Hyundai',
    'Tesla'
  ];
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 177, 91),
        title: Text('Add Vehicle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28),
            TextFormField(
              readOnly: true,
              onTap: () {
                showVehicleDropdown(context);
              },
              decoration: InputDecoration(
                labelText: '* Select a Vehicle Model',
                // filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              ),
              controller: TextEditingController(text: selectedVehicle),
            ),
            SizedBox(height: 28),
            //Registration number button-----------
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: '* Registration Number ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "Sharing this vehicle with friends/family",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text(
                "Add them to your vehicle pool and win exciting rewards in the future",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            //Submit button---------------------------
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 110, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handleSubmitDialogBox();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        backgroundColor: Color.fromARGB(255, 81, 177, 91),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showVehicleDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Vehicle Model'),
          content: Container(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: vehicleBrands.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedVehicle = vehicleBrands[index];
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(vehicleBrands[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void handleSubmitDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Details Add successfully'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
