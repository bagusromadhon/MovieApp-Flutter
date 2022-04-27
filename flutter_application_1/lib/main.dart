// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/welcome_screen.dart';
import './pages/splash_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'flutter demo',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(

        primarySwatch: Colors.blue
      ),
      home: WelcomeScreen(),
     
    
      
      
      );
  }
}