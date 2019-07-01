import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  double _finalResult = 0.0;
  int radioValue = 0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch(radioValue){
        case 0:
          _finalResult = CalculateWeight(_weightController.text, .06);
          _formattedText = "Your Weight on Pluto is ${_finalResult}";
          break;
        case 1:
          _finalResult = CalculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight on Mars is ${_finalResult}";
          break;
        case 2:
          _finalResult = CalculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight on Venus is ${_finalResult}";
          break;
        default:
          _finalResult = 180 * .38;
          _formattedText = "The default Weight is ${_finalResult}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weight on Planet X",
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              "images/planet.png",
              width: 200.0,
              height: 133.0,
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Your Weight on Earth!",
                      hintText: "In Pounds",
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Pluto",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Mars",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                      Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      Text(
                        "Venus",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _weightController.text.isEmpty? "Please enter weight!" :
                      "${_formattedText} lbs",
                      style: TextStyle(
                        fontSize: 19.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double CalculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0)
      return int.parse(weight) * multiplier;
    else
      print("Wrong!");
  }
}
