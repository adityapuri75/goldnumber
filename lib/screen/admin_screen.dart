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

  // newPostData() async {
  //   var message = await newPost(gameName.text, number.text, null, null);
  //   if (message.contains("ValidatorError"))
  //     Get.snackbar("Unsuccesful", "Post Not Added",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.black,
  //         colorText: Colors.white,
  //         duration: Duration(seconds: 5));

  //   Get.snackbar("Succesful", "Post Added",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.black,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 5));
  // }

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
            Container(
                child: CustomTextField(
              icon: Icons.description,
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
                  if (des.text.isNotEmpty || imgUrl.text.isNotEmpty) {
                    var message = await newPost(
                        gameName.text, number.text, des.text, imgUrl.text);
                    if (message.contains("ValidatorError"))
                      Get.snackbar("Unsuccesful", "Post Not Added",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black,
                          colorText: Colors.white,
                          duration: Duration(seconds: 5));

                    Get.snackbar("Succesful", "Post Added",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                        duration: Duration(seconds: 5));
                  } else {
                    var message =
                        await newPost(gameName.text, number.text, null, null);
                    if (message.contains("ValidatorError"))
                      Get.snackbar("Unsuccesful", "Post Not Added",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.black,
                          colorText: Colors.white,
                          duration: Duration(seconds: 5));

                    Get.snackbar("Succesful", "Post Added",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                        duration: Duration(seconds: 5));
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
