import 'package:flutter/material.dart';
import 'package:goldnumber/screen/admin_screen.dart';
import 'package:goldnumber/screen/post_screen.dart';
import 'package:goldnumber/widget/chart_results.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
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
                      "Guru Satta",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostScreen()));
                // createBannerAd()
                //   ..load()
                //   ..show();

                //                 videoAd.show();

                // launchURL(url[0]);
              },
              title: Text(
                "Guess Form",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart("Gali"),
                    ));
                // createBannerAd()
                //   ..load()
                //   ..show();

                //                 videoAd.show();

                // launchURL(url[0]);
              },
              title: Text(
                "GALI CHART",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart("Disawar"),
                    ));
                // createBannerAd()
                //   ..load()
                //   ..show();

                // videoAd.show();
                // launchURL(url[1]);
              },
              title: Text(
                "DESHAWER CHART",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart("FARIDABAD"),
                    ));
                // createBannerAd()
                //   ..load()
                //   ..show();

                // createInterstitialAd()
                //   ..load()
                //   ..show();
                // launchURL(url[2]);
              },
              title: Text(
                "FARIDABAD CHART",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              leading: Icon(Icons.insert_chart,
                  color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Chart("Ghaziabad"),
                    ));
                // createBannerAd()
                //   ..load()
                //   ..show();

                // createInterstitialAd()
                //   ..load()
                //   ..show();
                // launchURL(url[3]);
              },
              title: Text(
                "GAZIYABAD CHART",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                // setState(() {
                //   // _launched = _launchInBrowser(_launchUrl);
                // });
              },
              title: Text(
                "Join Telegram For Updates",
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
                "Privicy Policy",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
              leading:
                  Icon(Icons.person, color: Color.fromRGBO(149, 76, 233, 1)),
              // onTap: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => PolicyScreen(),
              //     )),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              title: Text(
                "Admin Page",
                style: TextStyle(
                    color: Color.fromRGBO(212, 175, 55, 1), fontSize: 16),
              ),
              leading:
                  Icon(Icons.settings_applications, color: Color.fromRGBO(149, 76, 233, 1)),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminScreen(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
