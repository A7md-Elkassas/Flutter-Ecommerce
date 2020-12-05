import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_shop/models/authentication.dart';
import 'package:m_shop/shared_component/email_field.dart';
import 'package:m_shop/shared_component/password_field.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../screens/forgotPassword/forgot_password_screen.dart';
import '../../shared_component/rounded_button.dart';
import '../../widgets/login/social_icon.dart';

enum AuthMode {
  Login,
  SignUp,
}
AuthMode _authMode = AuthMode.Login;

class AuthenticateBody extends StatefulWidget {
  @override
  _AuthenticateBodyState createState() => _AuthenticateBodyState();
}

class _AuthenticateBodyState extends State<AuthenticateBody> {
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_authMode == AuthMode.Login ? 'SignIn' : 'SignUp'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  _authMode == AuthMode.Login ? 'Welcome' : 'Register Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                Text(
                  _authMode == AuthMode.Login
                      ? 'Sign in with your email and password  \nor continue with social media'
                      : 'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                AuthenticateForm(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(
                      icon: 'assets/icons/facebook-2.svg',
                      click: () {},
                    ),
                    SocialIcon(
                      icon: 'assets/icons/google-icon.svg',
                      click: () {},
                    ),
                    SocialIcon(
                      icon: 'assets/icons/twitter.svg',
                      click: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: _switchAuthMode,
                      child: Text(
                        _authMode == AuthMode.Login ? 'SignUp' : 'Login',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthenticateForm extends StatefulWidget {
  @override
  _AuthenticateFormState createState() => _AuthenticateFormState();
}

class _AuthenticateFormState extends State<AuthenticateForm> {
  final _key = GlobalKey<FormState>();

  bool remember = false;
  TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;
  var _isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  @override
  void initState() {
    isVisible = true;
    super.initState();
  }

  String _errorDialogBox(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error Occurred'),
              content: Text(msg),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('ok'),
                )
              ],
            ));
  }

  Future<void> saveForm() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      setState(() {
        _isLoading = true;
      });
      try {
        if (_authMode == AuthMode.Login) {
          await Provider.of<Auth>(context, listen: false)
              .signIn(_authData['email'], _authData['password']);
        } else {
          await Provider.of<Auth>(context, listen: false)
              .signUp(_authData['email'], _authData['password']);
        }
      } on HttpException catch (error) {
        var errorMsg = 'Authentication Failed';
        if (error.toString().contains('INVALID_PASSWORD')) {
          errorMsg = 'Your Password is Invalid';
        } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
          errorMsg = 'We Couldn\'t find your email';
        } else if (error.toString().contains('INVALID_EMAIL')) {
          errorMsg = 'this is not a valid email address.';
        } else if (error.toString().contains('WEAK_PASSWORD')) {
          errorMsg = 'this password is very weak.';
        } else if (error.toString().contains('EMAIL_EXISTS')) {
          errorMsg = 'This Email is Already in use';
        }
        _errorDialogBox(errorMsg);
      } catch (e) {
        var errorMessage = 'We Cannot Authenticate You';
        _errorDialogBox(errorMessage);
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _key,
        child: Column(
          children: [
            EmailField(
              hintTxt: 'Enter Your Email',
              label: 'Email',
              child: SvgPicture.asset(
                'assets/icons/Mail.svg',
              ),
              onSave: (value) {
                _authData['email'] = value;
              },
            ),
            const SizedBox(height: 20),
            PasswordField(
              label: 'Password',
              hintTxt: 'Enter Your Password',
              child: SvgPicture.asset(
                'assets/icons/Lock.svg',
              ),
              passwordController: _passwordController,
              onSave: (value) {
                _authData['password'] = value;
              },
              onValidate: (value) {
                if (value.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
                return null;
              },
            ),
            if (_authMode == AuthMode.SignUp) SizedBox(height: 20),
            if (_authMode == AuthMode.SignUp)
              PasswordField(
                enable: _authMode == AuthMode.SignUp ? true : false,
                label: 'Password',
                hintTxt: 'Enter Your Password',
                child: SvgPicture.asset(
                  'assets/icons/Lock.svg',
                ),
                passwordController: _passwordController,
                onSave: (value) {
                  _authData['password'] = value;
                },
                onValidate: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Password is too short!';
                  }
                  return null;
                },
              ),
            if (_authMode == AuthMode.SignUp) SizedBox(height: 30),
            if (_authMode == AuthMode.Login)
              Row(
                children: [
                  Checkbox(
                      activeColor: kPrimaryColor,
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                        });
                      }),
                  Text('remember me'),
                  Spacer(),
                  FlatButton(
                    splashColor: Colors.transparent,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ForgotPasswordScreen.route);
                      //TODO:
                    },
                  ),
                ],
              ),
            if (_authMode == AuthMode.Login) SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator()
            else
              RoundedButton(
                text: _authMode == AuthMode.Login ? 'Login' : 'Register',
                click: saveForm,
              ),
          ],
        ),
      ),
    );
  }
}

// class AuthenticateForm extends StatefulWidget {
//   @override
//   _AuthenticateFormState createState() => _AuthenticateFormState();
// }
//
// class _AuthenticateFormState extends State<AuthenticateForm> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
