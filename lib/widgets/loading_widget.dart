import 'package:flutter/material.dart';

class LoadingDailog extends StatelessWidget {
  String messageText;
  LoadingDailog({super.key, required this.messageText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Color.fromARGB(255, 81, 177, 91),
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Loging...",
                style: TextStyle(fontSize: 16, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
