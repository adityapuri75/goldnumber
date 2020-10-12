import 'package:flutter/material.dart';
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
                  child: Image.asset('images/Sm1.png'),
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
              // createBannerAd()
              //   ..load()
              //   ..show();

              //                 videoAd.show();

              // launchURL(url[0]);
            },
            title: Text("GALI RECORD"),
          ),
          ListTile(
            leading: Icon(Icons.web_asset),
            onTap: () {
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
            title: Text("Donation"),
            leading: Icon(Icons.monetization_on),
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => DonationScreen(),
            //   ),
            // ),
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
