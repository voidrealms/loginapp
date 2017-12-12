import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
 _MyState createState() => new _MyState();
}

class _MyState extends State<MyApp> {
  String _title = 'Please Login';
  bool _authenticated = false;
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  login _login = new login(onSubmit: _onSubmit);
  settings _settings = new settings();


  Widget _screen = null;

   void onSubmit() {

    print(_login.username + ' : ' + _login.password);
    //if(_login.username == 'a' && _login.password== 'a') _setAuthenticated(true);

  }

  void _setAuthenticated(bool auth) {

    setState(() {
      if(auth == true)
      {
        _screen = _settings;
        _authenticated = true;
        _title = 'Welcome';
      }
      else
      {
        _screen = _login;
        _authenticated = false;
        _title = 'Please Login';
      }
    }
    );
  }

  void _goHome() {
    setState(() {
      if(_authenticated == true) {
        _screen = _settings;
      }
      else
      {
       _screen = _login;
      }
    }
    );
  }

  void _logout() {
    _setAuthenticated(false);
  }

  @override
  Widget build(BuildContext context) {
    if(_screen == null) _screen = _login;
    return new MaterialApp(
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: () {_goHome();}),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: () {_logout();}),
          ],
        ),
        body: _screen,
      ),
    );
  }
}