import 'dart:math';

import 'package:flutter/material.dart';

class BackGradW extends StatelessWidget {
  const BackGradW({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _backApp();

  }

  Widget _backApp(){

    final _back =  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: <Color> [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final _roseBox = Transform.rotate(
      angle: -pi / 3.6,
      child: Container(
        height: 360.0,
        width: 320.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )

        ),
      ),
    );
    
    

    return Stack(
      children: <Widget>[
        _back,
        Positioned(
          top: -100,
          child: _roseBox,
        ),
      ],
    );
  }
}