import 'package:flutter/material.dart';
// import 'package:smarttracking/register.dart';
// import 'package:http/http.dart' as http;
// import 'dart:js';
import 'package:smarttracking/login_screen.dart';

class Telephone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Tracking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    'images/telephone.jpg'), // เปลี่ยนเป็นที่อยู่ของรูปภาพที่คุณใช้
                width: 400.0, // ก าหนดความกว้าง
                height: 350.0, // ก าหนดความสูง
              ),
              // TextFormField(
            ],
          ),
        ),
      ),
    );
  }
}
