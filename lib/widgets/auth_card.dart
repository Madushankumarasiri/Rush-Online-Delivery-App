import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rush_delivery/screens/auth_screen.dart';
import '../constants.dart';
import 'package:rush_delivery/providers/auth.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  // ignore: unused_field
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text('An Error Occurred!'),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
    
      child: Container(
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            
            child: Column(
              children: <Widget>[
                // Text("Sign up with emil and password\n or continue with social media",
                // maxLines:2 ),
                SizedBox(height: 2),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    hintText: "Enter your email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: FaIcon(FontAwesomeIcons.envelope),
                    contentPadding: EdgeInsets.symmetric(horizontal:42, vertical:20),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: kTextColor),
                    gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color:kTextColor),
                      gapPadding: 10,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                SizedBox(height:10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: FaIcon(FontAwesomeIcons.lock),
                    contentPadding: EdgeInsets.symmetric(horizontal:42, vertical:20),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: kTextColor),
                    gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color:kTextColor),
                      gapPadding: 10,
                    ),
                  ),
                    
                  obscureText: true,
                  controller: _passwordController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                SizedBox(height:10),
                if (_authMode == AuthMode.Signup)
                  // SizedBox(height:20),
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: "Enter Password again",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: FaIcon(FontAwesomeIcons.lockOpen,size: 20,),
                    contentPadding: EdgeInsets.symmetric(horizontal:42, vertical:20),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: kTextColor),
                    gapPadding: 10,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color:kTextColor),
                      gapPadding: 10,
                    ),
                  ),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 10,
                ),
                if (_isLoading)
                  kProgressThreeBounce
                else
                  RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    // color: Theme.of(context).primaryColor,
                    color: kPrimaryColor,
                    // textColor: Theme.of(context).primaryTextTheme.button.color,
<<<<<<< HEAD
                    textColor:  kTextColor,
=======
                    textColor: kTextColor,
>>>>>>> 1b6cdfbaa28543953557c4ab564ad5733cd34dc0
                  ),
                FlatButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
<<<<<<< HEAD
                  textColor:  kTextColor,
=======
                  textColor: kTextColor,
>>>>>>> 1b6cdfbaa28543953557c4ab564ad5733cd34dc0
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
