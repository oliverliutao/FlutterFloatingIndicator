import 'package:flutter/material.dart';

void main() => runApp(new InputApp());

class InputApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);
  @override
  _InputPageState createState() => new _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  String _email;
  String _password;
  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Alert'),
            content: new Text('Email: $_email, password: $_password'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Form Input Demo"),
      ),
      body: new Center(
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Form(
                    key: formKey,
                    child: new Column(
                      children: <Widget>[
                        new TextFormField(
                          validator: (value) => !value.contains('@')
                              ? 'Not a valid email.'
                              : null,
                          onSaved: (val) => _email = val,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.person),
                            hintText: 'Enter your email',
                            labelText: 'Email',
                          ),
                        ),
                        new TextFormField(
                          validator: (val) =>
                              val.length < 6 ? 'Password too short.' : null,
                          onSaved: (val) => _password = val,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.lock),
                            hintText: 'Enter your password',
                            labelText: 'New Password',
                          ),
                          obscureText: true,
                        ),
                        new RaisedButton(
                          onPressed: _submit,
                          child: new Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    color: Colors.black54,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(5.0)),
                  ),
                  width: 100.0,
                  height: 100.0,
                ),
                new CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
