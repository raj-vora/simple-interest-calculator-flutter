import 'package:flutter/material.dart';

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  final _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var padding = EdgeInsets.only(top: 5.0, bottom: 5.0);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Container(child: Image.asset(
            'images/bank.png', 
            height: 125.0, 
            width: 125.0,),
            margin: EdgeInsets.all(10.0)
          ),
          InputTextField(
            label: 'Principal',
            hint: 'Enter Principal e.g. 12000',
          ),
          InputTextField(
            label: 'Rate of Interest',
            hint: 'In percent',
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InputTextField(
                  label: 'Term',
                  hint: 'Time in years',
                ),
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
                  value: 'Rupees', 
                  onChanged: (String valueSelected){

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
                    child: Text('Calculate'),
                    onPressed: (){},
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text('Reset'),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Idhar result aayega', 
            ),
          ),
        ],
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  final String label, hint;

  InputTextField({this.label, this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
        ),
      ),
    );
  }
}