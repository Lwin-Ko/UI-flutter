import 'package:flutter/material.dart';

import 'dart:ui';


class GridList extends StatefulWidget {
  GridList({Key key}) : super(key: key);

  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    return _buttonsRoundend();
  }

  
  Widget _buttonsRoundend(){

    return Table(
      children: [
        TableRow(
          children: [
            _createButtonR(Icons.calendar_today, Colors.blueAccent, 'Calendar'),
            _createButtonR(Icons.chat_bubble, Colors.greenAccent, 'Chat')
          ]
        ),
        TableRow(
          children: [
            _createButtonR(Icons.search, Colors.pinkAccent, 'Search'),
            _createButtonR(Icons.notifications, Colors.deepPurpleAccent, 'Notifications')
          ]
        ),
        TableRow(
          children: [
            _createButtonR(Icons.public, Colors.deepOrangeAccent,'News'),
            _createButtonR(Icons.settings, Colors.yellowAccent,'Settings')
          ]
        )
      ],
    );
  }

  Widget _createButtonR(IconData icono, Color color, String titulo){
    
    final itemsList = ClipRect(
  
          child: Container(
          height: 115.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 65, 107, 0.6),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icono, color: Colors.white, size: 30.0),
              ),
              Text(titulo , style: TextStyle(color: Colors.white))
            ],
          ),
        ),

    );

    return GestureDetector(
      child: itemsList,  
      onTap: (){
        Navigator.pushNamed(context, titulo);
      },
    );
  }

}