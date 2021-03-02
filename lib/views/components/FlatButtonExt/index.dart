import 'package:flutter/material.dart';

class FlatButtonExt extends StatelessWidget {
  String _text;
  Function _function;

  FlatButtonExt(
    {String text,
    Function function
    }
  ){
    this._text = text;
    this._function = function;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(_text, style: TextStyle(fontSize: 20),),
      padding: EdgeInsets.fromLTRB(70, 12, 70, 12),
      color: Colors.deepOrange[300],
      textColor: Colors.white,
      disabledColor: Colors.grey,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      onPressed: _function,
    );
  }
}