import 'package:chat_app/src/widgets/back_gradient.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexState();
  }
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textfield is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        children: <Widget>[
          BackGradW(),
          SingleChildScrollView(
            child: Column(
                    children: <Widget>[
                      _titles(),
                    _createFields(context)
                    ],
                  ),
          )
        ],
      ),
    ); 
  }

  Widget _createFields(context){
     final size = MediaQuery.of(context).size;
     return 
     SingleChildScrollView(
       child: Column(
         children: <Widget>[
           SafeArea(
            child: Container(
              height: 150.0,
            ),
          ),
          Container(
            width: size.width * 0.80,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: <Widget>[
                _createNameField(),
                  _createButton()
              ],
            ),
          ),
         ],
       ),
      );
  }

  Widget _createNameField() {
    return TextField(
          controller: _channelController,
          decoration: InputDecoration(
          errorText: _validateError
            ? "Channel name is mandatory"
            : null,
          border: UnderlineInputBorder(
              borderSide: BorderSide(width: 1)),
          hintText: 'Channel name'),
       );
  }

  Widget _createButton(){
    return RaisedButton(
        onPressed: () => onJoin(),
        child: Text("Join"),
        color: Colors.blueAccent,
        textColor: Colors.white,
    );
  }

   Widget _titles() {
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
                Text('Chat',
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

  onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => new CallPage(
                    channelName: _channelController.text,
                  )));
    }
  }

  _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
        [PermissionGroup.camera, PermissionGroup.microphone]);
  }
}
