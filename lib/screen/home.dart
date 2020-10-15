import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldnumber/bloc/games_bloc.dart';
import 'package:goldnumber/bloc/recent_games_bloc.dart';
import 'package:goldnumber/model/ads.dart';
import 'package:goldnumber/model/message.dart';
import 'package:goldnumber/widget/drwer.dart';
import 'package:goldnumber/widget/numbers.dart';
import 'package:goldnumber/widget/recent_number.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages = [];

  _getToken() async {
    _firebaseMessaging.getToken().then((token) async {
      print("Device Token: $token");
      var tok =
          await FirebaseFirestore.instance.collection('DeviceIDToken').get();
      var value = tok.docs.map((e) => e.data().containsValue(token));

      if (!value.contains(true)) {
        FirebaseFirestore.instance.collection('DeviceIDToken').add({
          "device_token": token,
        });
      }
    });
  }


  @override
  void initState() {
    
    _getToken();
    _firebaseMessaging.configure(

      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        final notification = message['notification'];
        setState(() {
          
          messages.add(Message(
              title: notification['title'], body: notification['body']));
        });
      },

      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

        final notification = message['data'];
        setState(() {
          messages.add(Message(
            title: '${notification['title']}',
            body: '${notification['body']}',
          ));
        });
      },
      
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    Ads.createBannerAd()
      ..load()
      ..show();
    Ads.createInterstitialAd()
      ..load()
      ..show();
    gameListBloc..getGames();
    recentGameList..getGames();
    super.initState();
  }

  Future<void> _getData() async {
    gameListBloc..getGames();
    recentGameList..getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(36, 48, 58, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(149, 76, 233, 1),
        centerTitle: true,
        title: Text(
          "Guru Satta",
          style: GoogleFonts.abrilFatface(
            fontSize: 29,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap: _getToken,child: SvgPicture.asset('Images/icon.svg')),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
      ),
      drawer: CustomDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _getData(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Upcoming Results",
                style: GoogleFonts.abrilFatface(
                  fontSize: 22,
                  color: Color.fromRGBO(212, 175, 55, 1),
                ),
              ),
              RecentGames(),
              Text(
                "Results",
                style: GoogleFonts.abrilFatface(
                  fontSize: 29,
                  color: Color.fromRGBO(212, 175, 55, 1),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(child: GuessNumber()),
            ],
          ),
        ),
      ),
    );
  }
}
