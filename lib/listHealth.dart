import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarttracking/editPage.dart';

class HealthDataPage extends StatefulWidget {
  @override
  _HealthDataPageState createState() => _HealthDataPageState();
}

class _HealthDataPageState extends State<HealthDataPage> {
  late Future<List<Map<String, dynamic>>> _HealthData;
  Future<List<Map<String, dynamic>>> _fetchHealthData() async {
    final response = await http
        .get(Uri.parse('http://localhost:88/apiflutter/selecthealth.php'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> parsed = json.decode(response.body);
      return parsed.cast<Map<String, dynamic>>();
    } else {
      throw Exception('ไมส่ ามารถเชอื่ มตอ่ ขอ้มลู ได ้กรณุ าตรวจสอบ');
    }
  }

  @override
  void initState() {
    super.initState();
    _HealthData = _fetchHealthData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
        leading: IconButton(
          icon: Icon(Icons
              .home_outlined), // ใชไ้อคอนลกู ศรทรงกลมทตี่ อ้ งการแทนทนี่ ี่
          color: Colors.red, // ก าหนดสไีอคอน
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Body Health',
              style: TextStyle(
                color: Colors.black, // ก าหนดสขี องตวัหนังสอืเป็นสแีดง
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _HealthData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('ไม่พบข ้อมูล'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height:
                        20), // เพมิ่ ระยะหา่ งระหวา่ งสว่ นดา้นบนกบั สว่ นขอ้มลู ใหม่

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/icon_temp.png', // ที่อยู่ของรูปภาพ Heart Rate
                      width: 40, // ก าหนดความกว ้างของรูปภาพ
                      height: 40, // ก าหนดความสูงของรูปภาพ
                    ),
                    SizedBox(
                        width:
                            10), // เพิ่มระยะห่างระหว่างรูปภาพและข ้อความ Heart Rate
                    Text(
                      'Body Health',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text(' ')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Surname')),
                        DataColumn(label: Text('Temp.')),
                        DataColumn(
                            label:
                                Text('Edit')), // เพิ่ม column ส าหรับป่มุ Edit
                      ],
                      rows: snapshot.data!.map((data) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(' ')),
                            DataCell(Text(data['firstname'].toString())),
                            DataCell(Text(data['lastname'].toString())),
                            DataCell(Text(data['heart_value'].toString())),
                            DataCell(IconButton(
// เพิ่ม IconButton หรือ TextButton ส าหรับ Edit
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditDataPage(data: data),
                                  ),
                                );
// เมื่อคลิก Edit ใหน้ าผใู้ชไ้ปยังหนา้แกไ้ขขอ้มูล
                              },
                            )),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HealthDataPage(),
  ));
}
