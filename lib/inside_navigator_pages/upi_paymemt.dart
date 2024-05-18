// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:upi_india/upi_india.dart';

// // import 'package:flutter_enhanced_barcode_scanner/flutter_enhanced_barcode_scanner.dart';
// // import 'main.dart';

// class UpiPayments extends StatefulWidget {
//   const UpiPayments({Key? key}) : super(key: key);

//   @override
//   UpiPaymentsState createState() => UpiPaymentsState();

//   void comeHere(context) {
//     Navigator.of(context).pushReplacementNamed(
//       'index',
//     );
//   }
// }

// class UpiPaymentsState extends State<UpiPayments> {
//   Future<UpiResponse>? _transaction;
//   final UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;

//   late double amt;
//   late String upiID;
//   late String message;
//   late String nm;

//   TextEditingController nmController = TextEditingController();
//   TextEditingController amtController = TextEditingController();
//   TextEditingController upiIDController = TextEditingController();
//   TextEditingController messageController = TextEditingController();

//   void resetToDefault() {
//     setState(() {
//       amt = 0.0;
//       upiID = "";
//       message = 'Not actual. Just an example.';
//       nm = "";
//     });
//   }

//   TextStyle header = const TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//   );

//   TextStyle value = const TextStyle(
//     fontWeight: FontWeight.w400,
//     fontSize: 14,
//   );

//   @override
//   void initState() {
//     _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//       setState(() {
//         apps = value;
//       });
//     }).catchError((e) {
//       apps = [];
//     });
//     super.initState();
//   }

//   Future<UpiResponse> initiateTransaction(
//       UpiApp app, double amt, String upiID, String message, String nm) async {
//     return _upiIndia.startTransaction(
//       app: app,
//       receiverUpiId: upiID,
//       receiverName: nm,
//       transactionRefId: 'TestingUpiIndiaPlugin',
//       transactionNote: message,
//       amount: amt,
//     );
//   }

//   Widget displayUpiApps() {
//     if (apps == null) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (apps!.isEmpty) {
//       return Center(
//         child: Text(
//           "No apps found to handle transaction.",
//           style: header,
//         ),
//       );
//     } else {
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap: () {
//                   _transaction =
//                       initiateTransaction(app, amt, upiID, message, nm);
//                   setState(() {});
//                 },
//                 child: SizedBox(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(30),
//                         child: Image.memory(
//                           app.icon,
//                           height: 60,
//                           width: 60,
//                         ),
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//     }
//   }

//   String _upiErrorHandler(error) {
//     switch (error) {
//       case UpiIndiaAppNotInstalledException:
//         return 'Requested app not installed on device';
//       case UpiIndiaUserCancelledException:
//         return 'You cancelled the transaction';
//       case UpiIndiaNullResponseException:
//         return 'Requested app didn\'t return any response';
//       case UpiIndiaInvalidParametersException:
//         return 'Invalid Transaction parameters';
//       default:
//         return 'An Unknown error has occurred';
//     }
//   }

//   void _checkTxnStatus(String status) {
//     switch (status) {
//       case UpiPaymentStatus.SUCCESS:
//         print('Transaction Successful');
//         break;
//       case UpiPaymentStatus.SUBMITTED:
//         print('Transaction Submitted');
//         break;
//       case UpiPaymentStatus.FAILURE:
//         print('Transaction Failed');
//         break;
//       default:
//         print('Received an Unknown transaction status');
//     }
//   }

//   Widget displayTransactionData(title, body) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$title: ", style: header),
//           Flexible(
//               child: Text(
//             body,
//             style: value,
//           )),
//         ],
//       ),
//     );
//   }

//   String getUpiID(String link) {
//     String result = "";
//     String cutStart = link.substring(13);
//     for (var i = 0; i < cutStart.length; i++) {
//       if (cutStart[i] == '&') {
//         break;
//       } else {
//         result += cutStart[i];
//       }
//     }
//     return result;
//   }

//   late String scanResult;

//   Widget options() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           iconSize: 32,
//           color: Colors.green,
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text(upiID),
//                   content:
//                       Text("Confirm to send Rs.$amt to the above address ?"),
//                   actions: [
//                     IconButton(
//                       onPressed: () {
//                         upiIDController.clear();
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.clear),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           amt = double.parse(amtController.text);
//                           message = messageController.text;
//                           upiID = upiIDController.text;
//                           nm = nmController.text;
//                         });
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.check),
//                     )
//                   ],
//                 );
//               },
//             );
//           },
//           icon: const Icon(Icons.check),
//         ),
//         IconButton(
//           onPressed: () async {
//             scanResult = await FlutterBarcodeScanner.scanBarcode(
//                 "#ff6666", "Exit", true, ScanMode.QR);
//             String upiAddress;
//             if (scanResult.substring(0, 3) != "upi") {
//               upiAddress = "Invalid UPI QR Code, try again !";
//             } else {
//               upiAddress = getUpiID(scanResult);
//             }
//             upiID = upiAddress;
//             upiIDController.text = upiAddress;
//             setState(() {});
//             // print(scanResult);
//           },
//           icon: const Icon(
//             Icons.qr_code,
//           ),
//           tooltip: "Scan to get UPI ID",
//         ),
//         IconButton(
//           iconSize: 32,
//           color: Colors.red,
//           onPressed: () {
//             setState(() {
//               amtController.clear();
//               messageController.clear();
//               upiIDController.clear();
//               nmController.clear();
//             });
//             resetToDefault();
//           },
//           icon: const Icon(Icons.delete),
//         ),
//       ],
//     );
//   }

//   Widget textField({
//     required TextEditingController ctrl,
//     required int fieldNum,
//     required String label,
//     required String hint,
//     required Icon descIcon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: TextField(
//         controller: ctrl,
//         onChanged: (value) {
//           setState(() {
//             // if (fieldNum == 1) {
//             //   nm = value;
//             // } else
//             if (fieldNum == 2) {
//               upiID = value;
//             } else if (fieldNum == 3) {
//               message = value;
//             } else if (fieldNum == 4) {
//               amt = double.parse(value);
//             }
//           });
//         },
//         keyboardType: fieldNum == 4 ? TextInputType.number : TextInputType.text,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           labelText: label,
//           hintText: hint,
//           prefixIcon: descIcon,
//           suffixIconColor: Colors.red,
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.clear),
//             onPressed: () {
//               ctrl.clear();
//               if (fieldNum == 2) {
//                 upiID = "";
//               } else if (fieldNum == 3) {
//                 message = "";
//               } else if (fieldNum == 4) {
//                 amt = 0.0;
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: myDrawer(context),
//       appBar: myAppBar(),
//       body: Column(
//         children: [
//           // textField(
//           //   ctrl: nmController,
//           //   fieldNum: 1,
//           //   label: 'Recepient',
//           //   hint: 'Reciever\'s name',
//           // ),
//           textField(
//             ctrl: upiIDController,
//             fieldNum: 2,
//             label: 'Reciever UPI ID',
//             hint: 'address@upi_app',
//             descIcon: const Icon(Icons.browser_updated),
//           ),
//           textField(
//             ctrl: messageController,
//             fieldNum: 3,
//             label: 'Message',
//             hint: 'Enter the message',
//             descIcon: const Icon(Icons.abc),
//           ),
//           textField(
//             ctrl: amtController,
//             fieldNum: 4,
//             label: 'Amount',
//             hint: 'Enter the amount',
//             descIcon: const Icon(Icons.numbers),
//           ),
//           options(),
//           SizedBox(
//             height: MediaQuery.of(context).size.height / 10,
//             width: MediaQuery.of(context).size.width,
//             child: Center(
//               child: Text(
//                 "Choose from your available UPI Apps",
//                 style: header,
//               ),
//             ),
//           ),
//           Expanded(
//             child: displayUpiApps(),
//           ),
//           Expanded(
//             child: FutureBuilder(
//               future: _transaction,
//               builder:
//                   (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text(
//                         _upiErrorHandler(snapshot.error.runtimeType),
//                         style: header,
//                       ), // Print's text message on screen
//                     );
//                   }

//                   // If we have data then definitely we will have UpiResponse.
//                   // It cannot be null
//                   UpiResponse upiResponse = snapshot.data!;

//                   // Data in UpiResponse can be null. Check before printing
//                   String txnId = upiResponse.transactionId ?? 'N/A';
//                   String resCode = upiResponse.responseCode ?? 'N/A';
//                   String txnRef = upiResponse.transactionRefId ?? 'N/A';
//                   String status = upiResponse.status ?? 'N/A';
//                   String approvalRef = upiResponse.approvalRefNo ?? 'N/A';
//                   _checkTxnStatus(status);

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         displayTransactionData('Transaction Id', txnId),
//                         displayTransactionData('Response Code', resCode),
//                         displayTransactionData('Reference Id', txnRef),
//                         displayTransactionData('Status', status.toUpperCase()),
//                         displayTransactionData('Approval No', approvalRef),
//                       ],
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text(''),
//                   );
//                 }
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   myAppBar() {}

//   myDrawer(BuildContext context) {}
// }
