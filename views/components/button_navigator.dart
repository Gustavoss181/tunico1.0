import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  IconData _icon;
  String _text;
  Function _onPressed;
  Color _cor;

  ButtonNavigator({
    IconData icon,
    String text,
    Function onPressed,
    Color cor,
  }) {
    this._icon = icon;
    this._text = text;
    this._onPressed = onPressed;
    this._cor = cor;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(0),
        child: InkWell(
          onTap: _onPressed,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black38, width: 1.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Icon(
                        _icon,
                        color: _cor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(_text),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ));
  }
}
