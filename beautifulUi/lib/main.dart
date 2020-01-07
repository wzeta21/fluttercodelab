import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'FriendlyChat',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('FriendlyChat'),
        ),
      ),
    ));

class FriendlychatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Friendlychat',
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text('Friendlychat'),),
    );
  }
}
