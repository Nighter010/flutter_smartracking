import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarttracking/login_screen.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthRegisterFormState createState() => _HealthRegisterFormState();
}

class _HealthRegisterFormState extends State<HealthForm> {
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _titlenameController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _heartValueController = TextEditingController();
  TextEditingController _pulseValueController = TextEditingController();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      // Format the selected date and update the controller
      String formattedDate = "${picked.day}/${picked.month}/${picked.year}";
      _dobController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('บันทึกข้อมูลสุขภาพ'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _idCardController,
                decoration: InputDecoration(labelText: 'บัตรประจำตัวประชาชน'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _titlenameController,
                decoration: InputDecoration(labelText: 'คำนำหน้าชือ'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _firstnameController,
                decoration: InputDecoration(labelText: 'ชื่อจริง'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _lastnameController,
                decoration: InputDecoration(labelText: 'นามสกุล'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _dobController,
                onTap: () {
                  _selectDate(context);
                },
                readOnly: true,
                decoration: InputDecoration(labelText: 'วันเกิด'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _heartValueController,
                decoration: InputDecoration(labelText: 'อัตราการเต้นหัวใจ'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _pulseValueController,
                decoration: InputDecoration(labelText: 'ความดัน'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  String idCard = _idCardController.text;
                  String titlename = _titlenameController.text;
                  String firstname = _firstnameController.text;
                  String lastname = _lastnameController.text;
                  String dob = _dobController.text;
                  String heartValue = _heartValueController.text;
                  String pulseValue = _pulseValueController.text;

                  await saveHealthData(
                    idCard,
                    titlename,
                    firstname,
                    lastname,
                    dob,
                    heartValue,
                    pulseValue,
                  );

                  Navigator.pop(context); // ปุ่มย้อนกลับ
                },
                child: Text('บันทึก'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 50),
                  primary: Colors.green,
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveHealthData(String idCard, String titlename, String firstname,
      String lastname, String dob, String heartValue, String pulseValue) async {
    final apiUrl = 'http://localhost:88/apiflutter/save_health.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'id_card': idCard,
          'titlename': titlename,
          'firstname': firstname,
          'lastname': lastname,
          'date_of_birth': dob,
          'heart_value': heartValue,
          'pulse_value': pulseValue,
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('บันทึกข้อมูลสุขภาพเรียบร้อยแล้ว')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถบันทึกข้อมูลสุขภาพได้')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดขณะบันทึกข้อมูลสุขภาพ')),
      );
    }
  }
}
