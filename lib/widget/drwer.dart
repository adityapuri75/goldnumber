import 'package:flutter/material.dart';
import 'package:goldnumber/model/ads.dart';
import 'package:goldnumber/screen/admin_screen.dart';
import 'package:goldnumber/screen/chart_screen.dart';
import 'package:goldnumber/screen/policy.dart';
import 'package:goldnumber/screen/post_screen.dart';
import 'package:goldnumber/screen/vip_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _launchUrl = 'https://t.me/gurukasatta';
  String _launchUrl1 = 'https://www.instagram.com/_zirkon/';
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(36, 48, 58, 1),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color.fromRGBO(149, 76, 233, 1),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Image(
                      image: AssetImage('Images/crown.png'),
                      height: 400,
                      width: 400,
                    ),
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    child: Text(
                      "Gold Satta King",
                      style: GoogleFonts.abrilFatface(
                          fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.multiline_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Ads.createInterstitialAd()
                  ..load()
                  ..show();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostScreen()));
                // createBannerAd()
                //   ..load()
                //   ..show();

                //                 videoAd.show();

                // launchURL(url[0]);
              },
              title: Text(
                "Guess Forum",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
                title: Text(
                  "VIP Membership",
                  style: TextStyle(
                      color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
                ),
                leading: Icon(Icons.monetization_on,
                    color: Color.fromRGBO(149, 76, 233, 1)),
                onTap: () {
                  Ads.createInterstitialAd()
                    ..load()
                    ..show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VipScreen(),
                      ));
                }),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Ads.createInterstitialAd()
                  ..load()
                  ..show();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartList(),
                    ));
              },
              title: Text(
                "Monthly CHART",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _launchInBrowser(_launchUrl);
                });
              },
              title: Text(
                "Join Telegram",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
              leading:
                  Icon(Icons.update, color: Color.fromRGBO(149, 76, 233, 1)),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
                ),
                leading:
                    Icon(Icons.person, color: Color.fromRGBO(149, 76, 233, 1)),
                onTap: () {
                    Ads.createInterstitialAd()
      ..load()
      ..show();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PolicyScreen(),
                      ));
                }),
            Divider(
              thickness: 2,
            ),
//            ListTile(
//              title: Text(
//                "Admin Page",
//                style: TextStyle(
//                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
//              ),
//              leading: Icon(Icons.settings_applications,
//                  color: Color.fromRGBO(149, 76, 233, 1)),
//              onTap: () => Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => AdminScreen(),
//                  )),
//            ),
//            Divider(
//              thickness: 2,
//            ),
          
          ],
        ),
      ),
    );
  }
}
