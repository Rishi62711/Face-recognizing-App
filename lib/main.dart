import 'package:cameraapp/screens/camera.dart';
import 'package:flutter/material.dart';
import 'screens/camera.dart';
import 'screens/home.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up.dart';
import 'screens/Person_Name.dart';
import 'screens/image_upload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: home_screen.id,
      routes: {
        CameraScreen.id: (context) => CameraScreen(),
        home_screen.id: (context) => home_screen(),
        loginscreen.id: (context) => loginscreen(),
        Name_of_Person.id: (context) => Name_of_Person(),
        image_upload.id: (context) => image_upload(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
