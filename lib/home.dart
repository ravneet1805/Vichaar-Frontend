import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String token = '';
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    //loadUserInfo();
    super.initState();
  }
  

  //  void loadUserInfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = prefs.getString('jwt_token') ?? '';
  //     email = prefs.getString('email') ?? '';
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: IconButton(
          iconSize: 50,
            onPressed: () async {
               // Remove token and email from SharedPreferences on logout
            // final prefs = await SharedPreferences.getInstance();
            // prefs.remove('jwt_token');
            // prefs.remove('email');
        
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        
            },
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.logout), Text('  Logout', style: TextStyle(fontSize: 25),)],
            )),
      ),
    );
  }
}
