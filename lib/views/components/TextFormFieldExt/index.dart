import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldExt extends StatelessWidget {
  int _maxLenght;
  TextInputType _textInputType;
  Icon _prefixIcon;
  TextEditingController _controller;
  String _hintText;
  String _prefixText;
  Function _onChanged;

  TextFormFieldExt(
    {int maxLenght,
    TextInputType textInputType,
    Icon prefixIcon,
    TextEditingController controller,
    String hintText,
    String prefixText,
    Function onChanged,
    }
  ){
    this._maxLenght = maxLenght;
    this._textInputType = textInputType;
    this._prefixIcon = prefixIcon;
    this._controller = controller;
    this._hintText = hintText;
    this._prefixText = prefixText;
    this._onChanged = onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: _maxLenght,
      keyboardType: _textInputType,
      decoration: InputDecoration(
        //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        fillColor: Colors.deepOrange[300],
        prefixIcon: _prefixIcon,
        prefixText: _prefixText,
        hintText: _hintText,
        counterStyle: TextStyle(color: Colors.white10)
      ),
      style: TextStyle(fontSize: 20),
      //controller: _phoneController,
      controller: _controller,
      onChanged: _onChanged,
    );
  }
}