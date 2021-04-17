import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _inputValue = '';
  bool _checkboxValue = false;
  int _radioValue = 0;
  bool _switchValue = false;
  double _sliderValue = 0.0;
  String _dateValue = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2025));
    if (picked != null)
      setState(() =>
          _dateValue = DateFormat("dd-MM-yyyy").format(picked).toString());
  }

  void _onChange(String value) {
    setState(() {
      _inputValue = 'Input value: $value';
    });
  }

  void _onSubmit(String value) {
    setState(() {
      _inputValue = 'Submit: $value';
    });
  }

  void _setCheckboxValue(bool value) => setState(() => _checkboxValue = value);

  void _setRadioValue(int value) => setState(() => _radioValue = value);

  void _setSwitchValue(bool value) => setState(() => _switchValue = value);

  void _setSliderValue(double value) => setState(() => _sliderValue = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form elements"),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
            children: <Widget>[
              Text(
                "Simple form",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Type a name',
                    icon: Icon(Icons.person)),
                autocorrect: true,
                autofocus: false,
                keyboardType: TextInputType.name,
                onChanged: _onChange,
                onSubmitted: _onSubmit,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _inputValue,
                style: TextStyle(fontSize: 16.0),
              ),
              CheckboxListTile(
                title: Text('Terms checkbox'),
                subtitle: Text('Terms details'),
                value: _checkboxValue,
                onChanged: _setCheckboxValue,
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Colors.green,
              ),
              Text(
                  'Checkbox value is ${_checkboxValue.toString()}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Radio buttons",
                style: TextStyle(fontSize: 16.0),
              ),
              RadioListTile(
                title: Text('Radio 1'),
                subtitle: Text('Subtitle radio 1'),
                value: 1,
                groupValue: _radioValue,
                onChanged: _setRadioValue,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              RadioListTile(
                title: Text('Radio 2'),
                subtitle: Text('Subtitle radio 2'),
                value: 2,
                groupValue: _radioValue,
                onChanged: _setRadioValue,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              RadioListTile(
                title: Text('Radio 3'),
                subtitle: Text('Subtitle radio 3'),
                value: 3,
                groupValue: _radioValue,
                onChanged: _setRadioValue,
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              Text(
                'Radio value is ${_radioValue.toString()}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              SwitchListTile(
                value: _switchValue,
                onChanged: _setSwitchValue,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("Switch option",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
              Text(
                'Switch value is ${_switchValue.toString()}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Slider value: ${(_sliderValue * 100).round()}',
                style: TextStyle(fontSize: 16.0),
              ),
              Slider(value: _sliderValue, onChanged: _setSliderValue),
              Text('Date Picker', style: TextStyle(fontSize: 16.0)),
              SizedBox(
                height: 10.0,
              ),
              Text('Date is $_dateValue', style: TextStyle(fontSize: 16.0)),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                child: Text(
                  'Select date',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                ),
                onPressed: _selectDate
              ),
            ],
          )))),
    );
  }
}
