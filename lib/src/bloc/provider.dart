import 'package:flutter/material.dart';
import 'package:chat_app/src/bloc/login_bloc.dart';
export 'package:chat_app/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget)  => true;

  Provider({ Key key, Widget child })
      : super (key: key, child: child);
      
  static LoginBloc of ( BuildContext context ) {
    return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginBloc;
  }  

}