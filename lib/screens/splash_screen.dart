import 'package:farm_control/constants/constants.dart';
import 'package:farm_control/repositories/SessionManager.dart';
import 'package:farm_control/screens/auth/login_screen.dart';
import 'package:farm_control/screens/root_navigation_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    String? userUUIDSaved = SessionManager().getString(USER_SESSION_KEY);
    print("User saved ${userUUIDSaved}");
    if (userUUIDSaved != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RootNavigationScreen()), // Update with your main screen
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginScreen()), // Update with your main screen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                'assets/images/splash_logo.png'), // Your splash screen logo
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
