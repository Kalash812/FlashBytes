import 'package:flutter/material.dart';
import 'package:news_app/screens/welcomeScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width) / 3),
              child: Row(
                children: [
                  Text(
                    'FLASH',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'BYTES',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Color.fromRGBO(108, 54, 249, 3),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ), //105,113,133
            Text(
              'Explore trending News, clips',
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Color.fromRGBO(105, 113, 133, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset('images/boy_logo.jpg'),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 32,
              backgroundColor: Color.fromRGBO(108, 54, 249, 0.8),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: Center(
                  child: Icon(
                    Icons.arrow_right_alt_sharp,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
