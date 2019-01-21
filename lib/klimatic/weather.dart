import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'util/utils.dart' as util;

class Klimatic extends StatefulWidget {
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  Dio dio = Dio();
  String _cityEntered;

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return ChangeCity();
      })
    );
    if (results != null && results.containsKey("enter")){
      _cityEntered = results["enter"]; 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Klimatic"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _goToNextScreen(context),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset("assets/images/umbrella.jpg",
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.9, 20.0, 0.0),
            child: Text(_cityEntered == null ? util.defaultCity : _cityEntered, style: cityStyle()),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/light_rain.png")
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 430.0, 0.0, 0.0),
            child: updateTempWidget(_cityEntered),
          )
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl = 'https://samples.openweathermap.org/data/2.5/weather?q=$city&appid=$appId';
    Response response;
    try {
      response = await dio.get(apiUrl);
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
      future: getWeather(util.appId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
        if (snapshot.hasData){
          Map content = snapshot.data;
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("${content['main']['temp'].toString()} F",
                  style: tempStyle()),
                  subtitle: ListTile(
                    title: Text(
                      "Humidiy: ${content['main']['humidity'].toString()}\n"
                      "Min: ${content['main']['temp_min'].toString()} F\n"
                      "Max: ${content['main']['temp_max'].toString()} F",
                      style: extraStyle()),
                  ),
                ),
              ],
            ),
          );
        }else{
          return Container();
        }
      });
  }
}

class ChangeCity extends StatelessWidget {
  final _cityFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Change City"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/white_snow.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill)
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter City"
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              ListTile(
                title: FlatButton(
                  onPressed: () => Navigator.of(context).pop({'enter': _cityFieldController.text}),
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: Text("Get Weather")
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle() {
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}

TextStyle extraStyle() {
  return TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontSize: 17.0
  );
}