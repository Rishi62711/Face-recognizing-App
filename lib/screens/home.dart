import 'package:cameraapp/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:cameraapp/screens/camera.dart';
import 'package:cameraapp/screens/image_upload.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cameraapp/screens/login_screen.dart';

class home_screen extends StatefulWidget {
  static const String id = 'Home_screen';
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'WSD PROJECT',
                style: TextStyle(fontSize: 40),
              )),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.grey),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Color(0xFF4D5d6C),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Sign Out',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("username");
                Navigator.pushNamed(context, loginscreen.id);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text('WSD Lab Project')),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Material(
                  shadowColor: Colors.pink,
                  elevation: 10,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'OPEN CAMERA',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Material(
                  shadowColor: Colors.pink,
                  elevation: 10,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(3),
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'ADD A USER',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, image_upload.id);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Material(
                  shadowColor: Colors.pink,
                  elevation: 10,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(3),
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        border: Border.all(width: 2.0, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'ADD AN IMAGE',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
