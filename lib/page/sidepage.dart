import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/locale.dart';
import 'package:localization_arb_example/page/aboutus.dart';
import 'package:localization_arb_example/page/change.dart';
import 'package:localization_arb_example/page/contact.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:localization_arb_example/page/language.dart';
import 'package:localization_arb_example/page/login.dart';
import 'package:localization_arb_example/page/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidepage extends StatefulWidget {
  const Sidepage({Key key}) : super(key: key);

  @override
  State<Sidepage> createState() => _SidepageState();
}

class _SidepageState extends State<Sidepage> {
  String cookie = "";
  void getCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString("csrftoken") != "" ||
          sharedPreferences.getString("csrftoken") == null) {
        cookie = sharedPreferences.getString("csrftoken");
        logout(cookie);
        print(cookie);
      } else {
        print("Not Valid");
      }
    });
  }

  Future<void> logout(cook) async {
    final response = await http
        .get(Uri.parse("http://178.18.247.188:8012/api/clt-logout/"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $cook',
    });
    print("Auth: $cook");
    print(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Account Logout Successfuly"),
        backgroundColor: Colors.green,
      ));
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    } else
      throw Exception(
          'We were not able to successfully download the json data.');
  }

  @override
  Widget build(BuildContext context) {
    Locale _locale;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xff2A5B74),
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(400.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 20,
                left: 20,
                bottom: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).profile,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Changepassword()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).changepassword,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      getCSRF();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_circle_left,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).logout,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 3,
              endIndent: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Language1()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.language,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).language1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Contectpag()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).contactus,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Aboutus()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppLocalizations.of(context).aboutus,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
