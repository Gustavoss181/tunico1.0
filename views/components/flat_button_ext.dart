import 'package:flutter/material.dart';

class FlatButtonExt extends StatelessWidget {
  String _text;
  Function _onPressed;
  FlatButtonExt({
    String text,
    Function onPressed,
  }) {
    this._text = text;
    this._onPressed = onPressed;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: SizedBox.expand(
          child: FlatButton(
              onPressed: _onPressed,
              child: Text(_text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ))),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            border: Border.all(color: Color.fromRGBO(255, 107,107, 1)),
            color: Color.fromRGBO(255, 107,107, 1)),
            
      ),
    );
  }
}