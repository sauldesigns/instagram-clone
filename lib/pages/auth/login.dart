import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidate: true,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              Text(
                'Instagram',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Phone number, username, email',
                      ),
                      validator: (email) {
                        if (!EmailValidator.validate(email)) {
                          return 'Invalid e-mail type';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password size must be 6 or greater';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0, bottom: 10.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text('Forgot password?'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: FlatButton(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
