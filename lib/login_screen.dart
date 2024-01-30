import 'package:flutter/material.dart';
// import 'package:smarttracking/register.dart';
// import 'package:http/http.dart' as http;
// import 'dart:js';
import 'package:smarttracking/splash_screen.dart';
import 'package:smarttracking/sosMain.dart';
import 'package:smarttracking/telephone.dart';
import 'package:smarttracking/location.dart';
// import 'package:smarttracking/hospital.dart';
import 'package:smarttracking/setting.dart';
import 'package:smarttracking/set_user.dart';
import 'package:smarttracking/listHealth.dart';
import 'package:smarttracking/bodyTemp.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Tracking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SplashScreen(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SosMain(),
                      ));
                    },
                    child: Image.asset(
                      'images/sos_main.png',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Telephone(),
                      ));
                    },
                    child: Image.asset(
                      'images/telephone.jpg',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Location(),
                      ));
                    },
                    child: Image.asset(
                      'images/location.jpg',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HealthDataPage(),
                      ));
                    },
                    child: Image.asset(
                      'images/Hospital.png',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Setting(),
                      ));
                    },
                    child: Image.asset(
                      'images/settings.png',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SettingUser(),
                      ));
                    },
                    child: Image.asset(
                      'images/user_set.png',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => BodyTemp(),
                      ));
                    },
                    child: Image.asset(
                      'images/user_set.png',
                      width: 150,
                      height: 150,
                    ),
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(150, 150),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: 2.0,
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
