import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double _result = 0.0;
  String _resultReading = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);
      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || height > 0) &&
          (_weightController.text.isNotEmpty || weight > 0)) {
        _result = (weight / (height * height)) * 10000;

        if (double.parse(_result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
        } else if (double.parse(_result.toStringAsFixed(1)) > 18.5 &&
            _result < 25) {
          _resultReading = "Great Shape!"; // Normal
        } else if (double.parse(_result.toStringAsFixed(1)) >= 25.0 &&
            _result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(_result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }
      } else {
        _result = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Image.asset(
              "images/bmi.png",
              height: 100.0,
              width: 60.0,
            ),
            new Container(
              margin: const EdgeInsets.all(8.0),
              height: 245.0,
              width: 300.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Age",
                        hintText: "e.g. 34",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Height in CM",
                          hintText: "e.g. 160",
                          icon: new Icon(Icons.insert_chart))),
                  new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Weight in KG",
                          hintText: "e.g. 80",
                          icon: new Icon(Icons.insert_chart))),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Container(
                    alignment: Alignment.center,
                    child: new RaisedButton(
                      onPressed: () => _calculateBMI(),
                      color: Colors.blue,
                      child: new Text("Caulculat"),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Your BMI: ${_result.toStringAsFixed(1)}",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
                new Padding(padding: EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading ",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
