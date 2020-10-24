-const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp(functions.config().functions);

var newData;

exports.myTrigger = functions.firestore
  .document("number/{id}")
  .onUpdate(async (snapshot, context) => {
    //

    const newValues = snapshot.after.data();
    const previousValues = snapshot.before.data();

    if (newValues !== previousValues) {
      const deviceIdTokens = await admin
        .firestore()
        .collection("DeviceIDToken")
        .get();

      var tokens = [];

      for (var token of deviceIdTokens.docs) {
        if (token.data().device_token !== null) {
          tokens.push(token.data().device_token);
        }
      }
      var payload = {
        notification: {
          title: "Result ",
          body: "Click to see Result",
          sound: "default",
        },
        data: {
          push_key: "Push Key Value",
          key1: "newData.data",
        },
      };

      try {
        const response = await admin.messaging().sendToDevice(tokens, payload);
        console.log("Notification sent successfully");
      } catch (err) {
        console.log(err);
      }
    }
  });
