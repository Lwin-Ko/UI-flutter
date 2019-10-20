import 'package:flutter/material.dart';
import 'package:chat_app/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBack(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(context){

    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 130.0,
            ),
          ),
          Container(
            width: size.width * 0.80,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
              border: Border.all(
                  color: Colors.black26,
                  width: 1.3,
                  style: BorderStyle.solid
              ),
            ),
            child: Column(
              children: <Widget>[
                Text('Sign in', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 40.0,),
                _createEmail( bloc ),
                SizedBox(height: 20.0,),
                _createPassword( bloc ),
                SizedBox(height: 20.0,),
                _createButton( bloc)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createBack(context){
    final size = MediaQuery.of(context).size;
    final back = Container(
      height: size.height * 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );
    final circle = Container(
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 0.8),
              Color.fromRGBO(241, 142, 172, 0.8)
            ]
          )
        
      ),
    );
    return Stack(
      children: <Widget>[
        back,
        Positioned( top: 90.0, left: 120.0 , child: circle,),
        Positioned( top: -30.0, left: -20.0 , child: circle,),
        Positioned( bottom: -40.0, right: -5.0 , child: circle,),
        Positioned( bottom: 50.0, right: 90.0 , child: circle,),
      ],
    );
  }

 
  Widget _createEmail(LoginBloc bloc){

    return  StreamBuilder(
        stream: bloc.emailStream ,
        builder: (BuildContext context, AsyncSnapshot snapshot){

            return  Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Colors.pinkAccent),
                hintText: 'youremail@email.com',
                labelText: 'E-mail',
                counterText: snapshot.data,
                errorText: snapshot.error
              ),
              onChanged: bloc.changeEmail ,
            ),
          );
        },
    );


  }

  Widget _createPassword(LoginBloc bloc){

     return StreamBuilder(
      stream: bloc.passwordStram ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock_outline, color: Colors.pinkAccent), 
              labelText: 'Password',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );

   
  }

  Widget _createButton( LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidator ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Enter'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            elevation: 0.8,
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: snapshot.hasData? ()=> _getDataLogin(bloc, context) : null,
          );
      },
    );
 
  }

  
   _getDataLogin(LoginBloc bloc, BuildContext context){
    print('======');
    print('email ${bloc.email}');
    print('password ${bloc.password}');
    print('======');
    Navigator.pushNamed(context, '/');
  }

}