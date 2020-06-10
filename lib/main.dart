import 'package:flutter/material.dart';
import 'si_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Interest Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: SIForm(),
      ),
    );
  }
}