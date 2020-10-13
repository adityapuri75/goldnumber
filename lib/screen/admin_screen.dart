import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goldnumber/repository/auth.dart';
import 'package:goldnumber/screen/edit_post_screen.dart';
import 'package:goldnumber/widget/custom_textfield.dart';

class AdminScreen extends StatelessWidget {
  final gameName = TextEditingController();
  final number = TextEditingController();
  final des = TextEditingController();
  final imgUrl = TextEditingController();

  showSnak(var message) async {
    if (message.contains("ValidatorError")) {
      Get.snackbar("Unsuccesful", "Post Not Added",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    } else {
      Get.snackbar("Succesful", "Post Added",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    }
  }

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
              icon: Icons.confirmation_number,
              hint: "Number",
              controller: number,
            )),
            SizedBox(
              height: 20,
            ),
            Padding(

                padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  child: TextFormField(
                    maxLines: 3,
                    controller: des,
                    decoration: InputDecoration(
                      hintText: "Description",
                      prefixIcon: Icon(
                        Icons.description,
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                elevation: 5,
                onPressed: () async {
                  if (des.text.isNotEmpty || imgUrl.text.isNotEmpty) {
                    var message = await newPost(
                        gameName.text, number.text, des.text, imgUrl.text);
                    showSnak(message);
                  } else {
                    var message =
                        await newPost(gameName.text, number.text, null, null);
                    showSnak(message);
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPost(),
                    )),
                color: Theme.of(context).primaryColorDark,
                child: Text(
                  "Edit Post ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
