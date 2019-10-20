import 'package:chat_app/src/pages/profile.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/src/pages/home.dart';
import 'package:chat_app/src/pages/login.dart';

class RouterPage extends StatefulWidget {
  RouterPage({Key key}) : super(key: key);

  _RouterPageState createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(_currentIndex) ,
      bottomNavigationBar: _bottomNav(context)
    );
  }

    Widget _callPage(int currentPage ) {
    switch(currentPage) {
      case 0 : return HomePage();
      case 1 : return ProfilePage();
      case 2 : return LoginPage();
      default: 
                return HomePage();
    }
  }

  Widget _bottomNav(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30.0),
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app, size: 30.0),
              title: Container(),
            )
          ],
        )
    );
  }  
}