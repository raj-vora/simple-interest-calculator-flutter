import 'package:flutter/material.dart';

class ReusableFormField extends StatelessWidget {
  final TextEditingController inputController;
  final String hint, label, error;
  
  ReusableFormField({this.inputController, this.error, this.hint, this.label});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: TextFormField(
        controller: inputController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          errorStyle: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 15.0,
          ),
          hintText: hint,
          labelText: label,
          labelStyle: textStyle,
        ),
        keyboardType: TextInputType.number,
        style: textStyle,
        validator: (String value) {
          if(value.isEmpty) return error;
          return null;
        },
      ),
    );
  }
}