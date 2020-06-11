import 'package:flutter/material.dart';

import 'reusable_formfield.dart';

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  final _currencies = ['Rupees', 'Dollars', 'Pounds'];
  String _currency = '', displayResult = '';

  @override
  void initState() {
    super.initState();
    _currency = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController termController = TextEditingController();

  String _calculateTotal() {
    double principal = double.parse(principalController.text);
    double interest = double.parse(interestController.text);
    double term = double.parse(termController.text);
    double total = principal + (principal * interest * term) / 100;

    return 'After $term years, your investment will be worth $total $_currency';
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(child: Image.asset(
              'images/bank.png', 
              height: 125.0, 
              width: 125.0,),
              margin: EdgeInsets.all(10.0)
            ),
            ReusableFormField(
              error: 'Please enter principal amount',
              hint: 'Enter Principal e.g. 12000',
              label: 'Principal',
              inputController: principalController,
            ),
            ReusableFormField(
              error: 'Please enter the interest',
              hint: 'In percent',
              label: 'Rate of Interest',
              inputController: interestController,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableFormField(
                    error: 'Please enter time',
                    hint: 'Time in years',
                    label: 'Term',
                    inputController: termController,
                  )
                ),
                SizedBox(width: 25.0),
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    value: _currency, 
                    onChanged: (String valueSelected){
                      setState(() {
                        _currency = valueSelected;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0, bottom: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text('Calculate', textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          if(_formKey.currentState.validate()) displayResult = _calculateTotal();
                        });                      
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Reset', textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          principalController.text = interestController.text = termController.text = displayResult =  '';
                          _currency = _currencies[0];
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                displayResult, 
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}