import 'package:flutter/material.dart';
import 'package:chat_app/src/bloc/provider.dart';
import 'package:chat_app/src/widgets/back_gradient.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Stack(
        children: <Widget>[
          BackGradW(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _title(),
                _textApp(bloc)
              ],
            ),
          )
        ],
      );
  }

    Widget _title() {
      return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Profile', style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold)),
              Text('this is a subtile app', style: TextStyle(color: Colors.white, fontSize: 18.0) )
            ],
          ),
        ),
      );
    }

  Widget _textApp(LoginBloc bloc){
      return SafeArea(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Email: ${bloc.email}', style: TextStyle(color: Colors.white, fontSize: 18.0) ),
              Text('Password: ${bloc.password}', style: TextStyle(color: Colors.white, fontSize: 18.0) )
            ],
          ),
        ),
      );
  }

}