import 'package:flutter/material.dart';
import 'package:chat_app/src/widgets/back_gradient.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGradW(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _title()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _title() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(top: 10.0),
                ),
                Text('Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}