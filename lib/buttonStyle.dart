import 'package:flutter/material.dart';

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blueGrey[800], // Dark background color for buttons
  foregroundColor: Colors.white, // Light text color for buttons
  textStyle: TextStyle(fontSize: 24),
);

Widget buildButton(String text, void Function(String) onPressed) {
  return Expanded(
    child: ElevatedButton(
      style: buttonStyle,
      onPressed: () => onPressed(text),
      child: Text(text, style: TextStyle(fontSize: 24)),
    ),
  );
}
