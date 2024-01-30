import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarttracking/splash_screen.dart';

class Setting extends StatefulWidget {
  _SettingDeviceState createState() => _SettingDeviceState();
}

class _SettingDeviceState extends State<Setting> {
  TextEditingController idDeviceController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();

  void showResultDialog(BuildContext context, bool isSuccess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isSuccess ? 'Successfully' : 'Failed'),
          content: Text(
            isSuccess
                ? 'Your information has been successfully saved.'
                : 'Failed to save information.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                if (isSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  );
                }
              },
              child: Text(isSuccess ? 'Go to Login Page' : 'Close'),
            ),
          ],
        );
      },
    );
  }

  void settingDevice() async {
    String imeiNo = idDeviceController.text;
    String deviceName = deviceNameController.text;

    String apiUrl = 'http://localhost:88/apiflutter/device.php';

    Map<String, dynamic> requestBody = {
      'imei_no': imeiNo,
      'Device_Name': deviceName,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('Data added successfully');
        showResultDialog(context, true);
      } else {
        print('Failed to add data');
        showResultDialog(context, false);
      }
    } catch (error) {
      print('Error connecting to the API: $error');
      showResultDialog(context, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: idDeviceController,
              decoration: InputDecoration(labelText: 'Device Id'),
            ),
            TextFormField(
              controller: deviceNameController,
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            ElevatedButton(
              onPressed: settingDevice,
              child: Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}

// void showSuccessDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Successfully'),
//         content: Text('Your information has been successfully saved..'),
//         actions: [
//           TextButton(
//             onPressed: () {
// //Navigator.of(context).pop(); // ปิดป๊ อปอัพ
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
// //builder: (context) => MainMenu(),
//                   builder: (context) => SplashScreen()));
//             },
//             child: Text('Goto Login Page'),
//           ),
//         ],
//       );
//     },
//   );
// }
