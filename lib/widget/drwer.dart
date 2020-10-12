import 'package:flutter/material.dart';
import 'package:goldnumber/widget/chart_results.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: null,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  margin: EdgeInsets.only(top: 28),
                  child: Text(
                    "Guess Number",
                    style: GoogleFonts.lato(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.web),
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
            title: Text("GALI CHART"),
          ),
          ListTile(
            leading: Icon(Icons.web_asset),
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
            title: Text("DESHAWER RECORD"),
          ),
          ListTile(
            leading: Icon(Icons.web),
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
            title: Text("FARIDABAD RECORD"),
          ),
          ListTile(
            leading: Icon(Icons.web_asset),
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
            title: Text("GAZIYABAD RECORD"),
          ),
          ListTile(
            onTap: () {
              // setState(() {
              //   // _launched = _launchInBrowser(_launchUrl);
              // });
            },
            title: Text("Join Telegram For Updates"),
            leading: Icon(Icons.update),
          ),
          ListTile(
            title: Text("Privicy Policy"),
            leading: Icon(Icons.person),
            // onTap: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => PolicyScreen(),
            //     )),
          )
        ],
      ),
    );
  }
}
