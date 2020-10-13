import 'package:flutter/material.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:goldnumber/widget/custom_textfield.dart';

class AdminScreen extends StatelessWidget {
  final gameName = TextEditingController();
  final number = TextEditingController();
  final des = TextEditingController();
  final imgUrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Page"),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                child: CustomTextField(
              icon: Icons.games,
              hint: "Game Name",
              controller: gameName,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
                child: CustomTextField(
              icon: Icons.image,
              hint: "Number",
              controller: number,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
                child: CustomTextField(
              icon: Icons.image,
              hint: "Description",
              controller: des,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
                child: CustomTextField(
              icon: Icons.image,
              hint: "Put the Image",
              controller: imgUrl,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                elevation: 5,
                onPressed: () async {
                  await newPost(
                      gameName.text, number.text, des.text, imgUrl.text);
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColorDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
