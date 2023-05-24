import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:localization_arb_example/page/sidepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  TextEditingController newpassController = TextEditingController();
  TextEditingController currentpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

  String cookie = "";
  void getCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString("csrftoken") != "" ||
          sharedPreferences.getString("csrftoken") == null) {
        cookie = sharedPreferences.getString("csrftoken");
        changepass(
          currentpassController.text.toString(),
          newpassController.text.toString(),
          confirmpassController.text.toString(),
          cookie,
        );
      } else {
        print("Not Valid");
      }
    });
  }

  void changepass(
    String current,
    newpass,
    confirm,
    cook,
  ) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $cook',
      };
      var request = http.Request(
          'POST', Uri.parse('http://178.18.247.188:8012/api/clt-upd-pass/'));
      request.body = json.encode(
          {"password": current, "newpass": newpass, "conpass": confirm});
      print(cook);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("updated"),
          backgroundColor: Colors.green,
        ));

        setState(() {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Welcome()));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Not updated",
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 10, bottom: 10, right: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sidepage()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/password.png",
                height: 80,
                width: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context).changepassword,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 30),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: new EdgeInsets.only(top: 17),
                        hintText: AppLocalizations.of(context).namea,
                        hintStyle: Theme.of(context).textTheme.headline1,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: TextField(
                      controller: currentpassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: new EdgeInsets.only(top: 17),
                        hintText: AppLocalizations.of(context).currentpassword,
                        hintStyle: Theme.of(context).textTheme.headline1,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: TextField(
                      controller: newpassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: new EdgeInsets.only(top: 17),
                        hintText: AppLocalizations.of(context).newpassword,
                        hintStyle: Theme.of(context).textTheme.headline1,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: TextField(
                      controller: confirmpassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: new EdgeInsets.only(top: 17),
                        hintText: AppLocalizations.of(context).confirmpassword,
                        hintStyle: Theme.of(context).textTheme.headline1,
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                  child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    color: const Color(0xff2A5B74),
                    onPressed: () {
                      if (currentpassController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter your Current Password"),
                          backgroundColor: Colors.red,
                        ));
                      } else if (newpassController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please enter your New password"),
                          backgroundColor: Colors.red,
                        ));
                      } else if (confirmpassController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Confirm Password"),
                          backgroundColor: Colors.red,
                        ));
                      } else if (newpassController.text.toString() ==
                          confirmpassController.toString()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Confirm Pass not match to New Pass"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        getCSRF();
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).applychange,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Sidepage()));
                      },
                      child: Text(
                        AppLocalizations.of(context).cancel,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
