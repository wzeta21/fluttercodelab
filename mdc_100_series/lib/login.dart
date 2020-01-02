import 'package:flutter/material.dart';
import 'colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(
                  height: 16.0,
                ),
                Text('SHRINE'),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            // TextField(
            //   controller: _usernammeController,
            //   decoration: InputDecoration(
            //       // filled: true,
            //       labelText: 'Username'),
            // ),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _usernammeController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            // TextField(
            //   controller: _passwordController,
            //   decoration: InputDecoration(
            //     // filled: true,
            //     labelText: 'Password',
            //   ),
            //   obscureText: true,
            // ),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0))
                  ),
                  onPressed: () {
                    _usernammeController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 8.0,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0))
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

final _usernammeController = TextEditingController();
final _passwordController = TextEditingController();

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
