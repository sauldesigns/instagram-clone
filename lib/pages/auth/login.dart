import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram/services/user_repo.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool showError = false;
  bool _autoValidate = false;
  bool isLoading = false;
  final FocusNode _emailFocus = new FocusNode();
  final FocusNode _passwordFocus = new FocusNode();

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  doSignIn(var userRepo, BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      bool result = await userRepo.signIn(_email, _password);
      if (result == true) {
        print('Success');
      } else {
        Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          margin: EdgeInsets.all(8.0),
          borderRadius: 10,
          duration: Duration(seconds: 5),
          message: 'Either password or e-mail are incorrect.',
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
        )..show(context);
        setState(() {
          showError = true;
          isLoading = false;
          _autoValidate = true;
        });
      }
    } else {
      setState(() {
        isLoading = false;
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userRepo = Provider.of<UserRepository>(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidate: _autoValidate,
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
                    fontSize: 80,
                    fontFamily: 'Billabong'),
              ),
              SizedBox(
                height: 50,
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
                      focusNode: _emailFocus,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: 'Phone number, username, email',
                      ),
                      validator: (email) {
                        if (email.isEmpty) {
                          return 'Please enter email';
                        } else if (EmailValidator.validate(email) == false) {
                          return 'Not a valid email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value,
                      onFieldSubmitted: (term) => _fieldFocusChange(
                          context, _emailFocus, _passwordFocus),
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
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
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
                      onSaved: (value) => _password = value,
                      onFieldSubmitted: (term) {
                        setState(() {
                          isLoading = true;
                        });
                        _passwordFocus.unfocus();
                        doSignIn(userRepo, context);
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
                      setState(() {
                        isLoading = true;
                      });
                      doSignIn(userRepo, context);
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      isLoading == false
                          ? Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            )
                          : SpinKitChasingDots(
                              color: Colors.white,
                              size: 18,
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
