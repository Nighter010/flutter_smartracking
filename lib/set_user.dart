import 'package:flutter/material.dart';
import 'package:smarttracking/login_screen.dart';

class SettingUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting User'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'SurName'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password again'),
                obscureText: true, // ซ่อนข้อความในรหัสผ่าน
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Save'),
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
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
