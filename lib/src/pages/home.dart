import 'package:chat_app/src/widgets/grid_list.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/src/widgets/back_gradient.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            BackGradW(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titles(),
                 _createItems()
                ],
              ),
            )

          ],
        );
       

  }

   Widget _titles(){

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Home', style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold)),
              Text('this is a subtile app', style: TextStyle(color: Colors.white, fontSize: 18.0) )
            ],
          ),
        ),
      );
    
  }

  Widget _createItems(){
    return  GridList();
    
    
  }
}
