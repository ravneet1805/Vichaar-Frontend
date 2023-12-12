import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lgoin_ui/home.dart';
import 'package:lgoin_ui/signup.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future<void> loginUser(String email, String password, BuildContext context) async {
    const url =
        'http://localhost:4000/users/signin'; // Replace with your actual API endpoint

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Successful login, handle the response accordingly
      final responseData = json.decode(response.body);

      showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(message: responseData['message']),
  );
      // Do something with the response data
      // final jwtToken = responseData['token'];
      // final userEmail = responseData['user']['email'];

      // Store token and email in SharedPreferences
      // final prefs = await SharedPreferences.getInstance();
      // prefs.setString('jwt_token', jwtToken);
      // prefs.setString('email', userEmail);
      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
      print(responseData);
    } else {
      // Handle errors, you can show an error message to the user
      final responseData = json.decode(response.body);
      
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(message: responseData['message']),
  );
      print('Error: ${response.statusCode}');
      print('Response: ${response.body}');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/logo.png'),
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                          color: Color(0xff203142),
                          fontSize: 24,
                          fontFamily: 'Rubik Medium'),
                    ),
                    Text(
                      'World',
                      style: TextStyle(
                          color: Color(0xffF9703B),
                          fontSize: 24,
                          fontFamily: 'Rubik Medium'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Color(0xff203142),
                    fontSize: 24,
                    fontFamily: 'Rubik Medium'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Enter your Email and Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff4C5980),
                    fontSize: 16,
                    fontFamily: 'Rubik Regular'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 40, top: 10),
              child: TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  fillColor: Color(0xffF8F9FA),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Color(0xff323F4B),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: Color(0xffF8F9FA),
                  filled: true,
                  suffixIcon: Icon(Icons.visibility_off),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xff323F4B),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200,),
            GestureDetector(
              onTap: () {
                print("email:"+email+"   "+"pass:"+password);
                loginUser(email, password, context);
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Rubik Regular',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff4C5980),
                      fontSize: 16,
                      fontFamily: 'Rubik Regular'),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Rubik Medium'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
