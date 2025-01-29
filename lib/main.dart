import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'buttonStyle.dart'; // Import the button style and buildButton method

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elijah Smith-Antonides',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[800],
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _result = '';

  void _onPressed(String text) {
    setState(() {
      if (text == 'C') {
        _expression = '';
        _result = '';
      } else if (text == '=') {
        try {
          final expression = Expression.parse(_expression);
          final evaluator = const ExpressionEvaluator();
          final result = evaluator.eval(expression, {});
          _result = result.toString();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elijah Smith-Antonides'),
      ),
      body: Container(
        color: Colors.black, // Set the background color here
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression,
                      style: TextStyle(fontSize: 32, color: Colors.white70),
                    ),
                    Text(
                      _result,
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton('7', _onPressed),
                buildButton('8', _onPressed),
                buildButton('9', _onPressed),
                buildButton('/', _onPressed),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4', _onPressed),
                buildButton('5', _onPressed),
                buildButton('6', _onPressed),
                buildButton('*', _onPressed),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1', _onPressed),
                buildButton('2', _onPressed),
                buildButton('3', _onPressed),
                buildButton('-', _onPressed),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('0', _onPressed),
                buildButton('%', _onPressed), // Add the modulo button here
                buildButton('C', _onPressed),
                buildButton('+', _onPressed),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('=', _onPressed),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
