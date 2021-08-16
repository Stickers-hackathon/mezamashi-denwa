import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String number) async {
  final editedNumber = number.substring(1);
  final inputNumber = "tel:+81 $editedNumber";
  if (await canLaunch(inputNumber)) {
    await launch(inputNumber);
  } else {
    throw "Could not launch $inputNumber";
  }
}

void phoneCallPopUp(BuildContext context) {
  String input = "";

  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("電話をかける"),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 24,
          ),
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "電話番号を入力",
                hintText: "000-0000-0000",
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (string) {
                input = string;
              },
            ),
            InkWell(
              child: Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.phone_forwarded,
                    color: Colors.white,
                  )),
              onTap: () {
                if (input != "") {
                  makePhoneCall(input);
                }
              },
            ),
          ],
        );
      });
}
