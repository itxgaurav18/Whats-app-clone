import 'package:camera/camera.dart';
import 'Screens/CameraScreen.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreens.dart';
import 'LandingScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     primaryColor: Color(0xFF075E54),
      //     hintColor: Color(0xFF128C7E)
      // ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFF128C7E),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF128C7E),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF075E54),
        )
      ),
      home: LandingScreen(),
    );
  }
}

