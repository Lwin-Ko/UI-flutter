import 'package:flutter/material.dart';
import 'package:chat_app/src/bloc/provider.dart';

import 'package:chat_app/src/pages/router_page.dart';
import 'package:chat_app/src/routes/routes.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutesApp(),
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => RouterPage()
        );
      },
      theme: ThemeData(
        primaryColor: Colors.pinkAccent
      ),
    ),
    );
    
  }
}


