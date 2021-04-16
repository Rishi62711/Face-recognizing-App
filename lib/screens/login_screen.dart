import 'package:flutter/material.dart';
import 'package:cameraapp/screens/home.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cameraapp/size_config.dart';

import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;
  AnimationController controller;
  Animation animation;
  Animation animationtween;
  String email;
  String password;
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationtween = ColorTween(begin: Colors.green, end: Colors.white24)
        .animate(controller);
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return ModalProgressHUD(
              inAsyncCall: showspinner,
              child: Scaffold(
                backgroundColor: animationtween.value,
                body: ListView(
                  children: <Widget>[
                    Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                            child: Hero(
                              tag: 'hero',
                              child: Container(
                                width: animation.value *
                                    25 *
                                    SizeConfig.widthMultiplier,
                                height: animation.value *
                                    11.5 *
                                    SizeConfig.heightMultiplier,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Face Recognition App',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: animation.value *
                                      5 *
                                      SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: animation.value *
                                          4.14 *
                                          SizeConfig.textMultiplier),
                                ),
                                SizedBox(
                                  height: 0.3 * SizeConfig.heightMultiplier,
                                ),
                                Text(
                                  'Hi there!Nice to see you again',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold,
                                      fontSize: animation.value *
                                          2.2 *
                                          SizeConfig.textMultiplier),
                                ),
                                SizedBox(
                                  height: 2 * SizeConfig.heightMultiplier,
                                ),
                                Text(
                                  'Email/Phone No.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: animation.value *
                                          3 *
                                          SizeConfig.textMultiplier),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.lightBlue),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "enter the email adress";
                                    } else {
                                      email = value;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Colors.lightBlue),
                                    hintText: 'example@email.com',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: animation.value *
                                          3 *
                                          SizeConfig.textMultiplier),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.lightBlue),
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    hasFloatingPlaceholder: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.lightBlue),
                                    suffixIcon: GestureDetector(
                                      onLongPress: () {
                                        setState(() {
                                          _passwordVisible = true;
                                        });
                                      },
                                      onLongPressUp: () {
                                        setState(() {
                                          _passwordVisible = false;
                                        });
                                      },
                                      child: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.lightBlue,
                                      ),
                                    ),
                                  ),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "*Password needed";
                                    } else {
                                      password = value;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 6 * SizeConfig.heightMultiplier,
                                ),
                                MaterialButton(
                                  elevation: 8,
                                  onPressed: () async {
                                    setState(() async {
                                      if (_formkey.currentState.validate()) {
                                        setState(() {
                                          showspinner = true;
                                        });

                                        try {
                                          final user = await _auth
                                              .signInWithEmailAndPassword(
                                                  email: email,
                                                  password: password);

                                          if (user != null) {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setString("username", email);
                                            Navigator.pushNamed(
                                                context, home_screen.id);
                                          }
                                          setState(() {
                                            showspinner = false;
                                          });
                                        } catch (e) {
                                          print(e);
                                          DangerAlertBox(
                                              context: context,
                                              messageText:
                                                  'you have not selected address or did not picked a date',
                                              title:
                                                  'Please select address and date');
                                        }
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: animation.value * 20,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: Color(0xFFad6364),
                                )
                              ],
                            ),
                          ),
                          FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
