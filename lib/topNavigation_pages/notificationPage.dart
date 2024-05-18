import 'package:flutter/material.dart';

class notificationsPage extends StatelessWidget {
  notificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificaton Page'),
      ),
      body: Center(
        child: Text('This is the notifications Page'),
      ),
    );
  }
}
