import 'package:flutter/material.dart';
import 'package:smarttracking/listHealth.dart';
import 'package:http/http.dart' as http;

class EditDataPage extends StatefulWidget {
  final Map<String, dynamic> data;
  EditDataPage({required this.data});
  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  late TextEditingController idCardController;
  late TextEditingController titleNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController heartValueController;
  late TextEditingController pulseValueController;

  @override
  void initState() {
    super.initState();
    idCardController =
        TextEditingController(text: widget.data['id_card'].toString());
    titleNameController =
        TextEditingController(text: widget.data['titlename'].toString());
    firstNameController =
        TextEditingController(text: widget.data['firstname'].toString());
    lastNameController =
        TextEditingController(text: widget.data['lastname'].toString());
    dateOfBirthController =
        TextEditingController(text: widget.data['date_of_birth'].toString());
    heartValueController =
        TextEditingController(text: widget.data['heart_value'].toString());
    pulseValueController =
        TextEditingController(text: widget.data['pulse_value'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: idCardController,
              decoration: InputDecoration(labelText: 'ID Card'),
            ),
            TextFormField(
              controller: titleNameController,
              decoration: InputDecoration(labelText: 'Title Name'),
            ),
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextFormField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextFormField(
              controller: heartValueController,
              decoration: InputDecoration(labelText: 'Heart Value'),
            ),
            TextFormField(
              controller: pulseValueController,
              decoration: InputDecoration(labelText: 'Pulse Value'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String updatedIdCard = idCardController.text;
                String updatedTitleName = titleNameController.text;
                String updatedFirstName = firstNameController.text;
                String updatedLastName = lastNameController.text;
                String updatedDateOfBirth = dateOfBirthController.text;
                String updatedHeartValue = heartValueController.text;
                String updatedPulseValue = pulseValueController.text;

                String apiUrl = 'http://localhost:88/apiflutter/IUD.php';

                Map<String, dynamic> requestBody = {
                  'id_card': updatedIdCard,
                  'titlename': updatedTitleName,
                  'firstname': updatedFirstName,
                  'lastname': updatedLastName,
                  'date_of_birth': updatedDateOfBirth,
                  'heart_value': updatedHeartValue,
                  'pulse_value': updatedPulseValue,
                  'case':
                      '2', // Ensure this is a string if it's expected as a string on the server
                };

                try {
                  var response = await http.post(
                    Uri.parse(apiUrl),
                    body: requestBody,
                  );

                  if (response.statusCode == 200) {
                    showSuccessDialog(context, "Data saved successfully");
                  } else {
                    showSuccessDialog(
                        context, "Failed to save data. ${response.body}");
                  }
                } catch (error) {
                  showSuccessDialog(
                    context,
                    'Error connecting to the server: $error',
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    idCardController.dispose();
    titleNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    heartValueController.dispose();
    pulseValueController.dispose();
    super.dispose();
  }

  void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HealthDataPage(),
                  ),
                );
              },
              child: Text('Go to Health Data Page'),
            ),
          ],
        );
      },
    );
  }
}
