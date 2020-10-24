import 'package:flutter/material.dart';
import 'dart:async';

import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gameListBloc..getGames();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(context, '/screen0', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001434),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset('Images/spl.png'),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            Text(
              "GOLD SATTA KING",
              style: GoogleFonts.abrilFatface(
                fontSize: 40,
                color: Color.fromRGBO(212, 175, 55, 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
