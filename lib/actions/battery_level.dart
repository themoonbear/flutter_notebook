import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {
  _BatteryLevelState createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = "Unknown battery level.";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try{
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery level as $result %.";
    } on PlatformException catch(e){
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Battery Level")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel)
          ],
        ),
      ),
    );
  }
}