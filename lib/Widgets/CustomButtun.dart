import 'package:flutter/material.dart';

class CustomButtun extends StatefulWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final Color color;


  CustomButtun(
      {this.title,
        this.textColor,
        this.fontSize,
        this.fontWeight,
        this.onPressed,
        this.color,
      });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButtun> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: widget.onPressed,
      color: widget.color,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.textColor,
                  decoration: TextDecoration.none,
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight),
            ),
            // Icon(Icons.arrow_forward,color: Colors.white,),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),

      ),
    );
  }
}
