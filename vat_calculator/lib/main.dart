import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Vat calculator', home: VatCalculator()));
}

class VatCalculator extends StatelessWidget {
  double billAmount = 0.0;
  double vatPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: InputDecoration(labelText: "Base amount(\$)"),
    );

    // Create another input field
    TextField vatPercentageField = TextField(
        decoration: InputDecoration(labelText: "Vat %", hintText: "23"),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            vatPercentage = double.parse(value);
          } catch (exception) {
            vatPercentage = 0.0;
          }
        });

    // Create button
    ElevatedButton calculateButton = ElevatedButton(
        child: Text("Calculate"),
        onPressed: () {
          // Calculate tip and total
          double calculatedVat = billAmount * vatPercentage / 100.0;
          double total = billAmount + calculatedVat;

          AlertDialog dialog = AlertDialog(
              content: Text("Vat: \$$calculatedVat \n"
                  "Total: \$$total"));

          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        });

    SizedBox sizedBox = SizedBox(
      height: 20.0,
    );

    Container container = Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          billAmountField,
          vatPercentageField,
          sizedBox,
          calculateButton
        ]));

    Scaffold scaffold = Scaffold(
        appBar: AppBar(
          title: Text("Vat calculator"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: container);
    return scaffold;
  }
}
