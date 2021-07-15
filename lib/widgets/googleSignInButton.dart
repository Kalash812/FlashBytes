import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/welcomeScreen.dart';
import 'package:news_app/services/auth.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : GestureDetector(
            onTap: () async {
              setState(() {
                _isSigningIn = true;
              });

              User? user = await Authentication.signInWithGoogle(context);

              setState(() {
                _isSigningIn = false;
              });

              if (user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              }
            },
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/google_icon.png',
                    scale: 6,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
