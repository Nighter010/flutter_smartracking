import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smarttracking/login_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BodyTemp extends StatefulWidget {
  @override
  _BodyTempState createState() => _BodyTempState();
}

class _BodyTempState extends State<BodyTemp> {
  double gaugeValue = 0; // ค่าเริ่มต้นส าหรับ Gauge
  @override
  void initState() {
    super.initState();
    fetchData().then((value) {
      setState(() {
        gaugeValue = value;
      });
    });
  }

  Future fetchData() async {
    final response = await http
        .get(Uri.parse('http://localhost:88/apiflutter/Bodytemp.php'));

    if (response.statusCode == 200) {
      try {
        final List<dynamic> jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          for (var data in jsonData) {
            String dateLog = data['date_log'];
            double tempValue = double.parse(data['temp_value']);
            print('Date: $dateLog, Temperature: $tempValue');
            return tempValue;
          }
        } else {
          print('Empty JSON data');
          // หากไม่มีข้อมูล JSON, คุณสามารถ return ค่าที่เหมาะสมเพื่อแจ้งให้เห็นว่าไม่มีข้อมูล
          return 0.0;
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        // หากมีข้อผิดพลาดในการแปลง JSON, คุณสามารถ return ค่าที่เหมาะสม
        return 0.0;
      }
    } else {
      print('HTTP error: ${response.statusCode}');
      // หากเกิดข้อผิดพลาดในการเรียก API, คุณสามารถ return ค่าที่เหมาะสม
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .lightGreen.shade400, // ก าหนดสีพื้นหลังของ AppBar เป็นสีน้ าเงิน
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
// เพิ่มโค้ดส าหรับการกลับได้ที่นี่
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
        ),
        title: Text('Smart Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
// เพิ่มโค้ดส าหรับการค้นหาได้ที่นี่
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.15,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.grey[700],
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 40,
                      color: Colors.green,
                      startWidth: 0.15,
                      endWidth: 0.15,
                    ),
                    GaugeRange(
                      startValue: 40,
                      endValue: 70,
                      color: Colors.orange,
                      startWidth: 0.15,
                      endWidth: 0.15,
                    ),
                    GaugeRange(
                      startValue: 70,
                      endValue: 100,
                      color: Colors.red,
                      startWidth: 0.15,
                      endWidth: 0.15,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: gaugeValue,
                      needleLength: 0.8,
                      lengthUnit: GaugeSizeUnit.factor,
                      needleColor: Colors.black,
                      knobStyle: KnobStyle(
                        knobRadius: 0.08,
                        sizeUnit: GaugeSizeUnit.factor,
                        color: Colors.black,
                      ),
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        'Body Temperature',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      angle: 90,
                      positionFactor: 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
/*
SizedBox(height: 20), // ระยะห่างระหว่าง Gauge และข้อความ
Text(
'Body Temperature',
style: TextStyle(

fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
),
*/
        ],
      ),
    );
  }
}
