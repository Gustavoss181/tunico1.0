import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  IconData _icon;
  String _text;
  Function _onPressed;
  Color _color;

  SquareButton({
    IconData icon,
    String text,
    Function onPressed,
    Color color,
  }) {
    this._icon = icon;
    this._text = text;
    this._onPressed = onPressed;
    this._color = color;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.width * 0.45,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: Icon(
                  _icon,
                  size: MediaQuery.of(context).size.height * 0.08,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  _text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        onTap: _onPressed,
      ),
    );
  }
}
