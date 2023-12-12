import 'package:flutter/material.dart';
import 'package:lgoin_ui/login.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  //   await SharedPreferences.getInstance();
  // } catch (error) {
  //   print('Error initializing SharedPreferences: $error');
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
