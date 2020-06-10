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
    TextStyle textStyle = Theme.of(context).textTheme.title;
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
                    color: Theme.of(context).accentColor,
                    textColor: Theme.of(context).primaryColorDark,
                    child: Text('Calculate', textScaleFactor: 1.5,),
                    onPressed: (){
                        
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text('Reset', textScaleFactor: 1.5,),
                    onPressed: (){
                      
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Idhar result aayega', 
              style: textStyle,
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
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: TextField(
        keyboardType: TextInputType.number,
        style: textStyle,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: textStyle,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
        ),
      ),
    );
  }
}