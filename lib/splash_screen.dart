import 'package:flutter/material.dart';
import 'package:smarttracking/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('./images/sos.png'),
            SizedBox(height: 20.0),
            Text(
              'Welcome!! Smart Tracking',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              //width: double.infinity, // ก ําหนดควํามกว้ํางให้เต็มหน้ําจอ
              child: OutlinedButton(
                onPressed: () {
                  // เมื่อปุ่มถูกคลิก
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  side: BorderSide(
                    color: Color.fromARGB(
                        255, 164, 128, 225), // Set the outline color
                    width: 2.0, // Set the outline width
                  ),
                  backgroundColor: Color.fromARGB(
                      255, 164, 128, 225), // Set the background color
                ),
                child: Text(
                  'เริ่มใช้งาน',
                  style: TextStyle(
                    color: Colors.white, // Set the text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
