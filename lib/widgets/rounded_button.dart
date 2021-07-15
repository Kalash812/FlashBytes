import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 10,
          shadowColor: Colors.white,
          shape: (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.white)))),
      onPressed: () {
        setState(() {
          color = Colors.black;
        });
      },
      child: Text(
        'Sports',
        style: TextStyle(
          color: Color.fromRGBO(105, 113, 133, 1),
        ),
      ),
    );
  }
}
