import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/page/eidtprofile.dart';
import 'package:localization_arb_example/page/sidepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var headers = {
  //   'Cookie':
  //       'csrftoken=dKVlIGZW1NYkPSWR3hDJUsmGcvl88S4qTkYmoaP0ho5tTFbXc67WzcrIy9k8ihN4; sessionid=cfteh6iqzfwfettfzjam6vu3evxjzgnu'
  // };
  String cookie = "";
  void getCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString("csrftoken") != "" ||
          sharedPreferences.getString("csrftoken") == null) {
        cookie = sharedPreferences.getString("csrftoken");
        fetchpost(cookie);
      } else {
        print("Not Valid");
      }
    });

    print("Token Saved" + sharedPreferences.getString("csrftoken"));
  }

  String firstname = "";
  Future<void> fetchpost(String cook) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final response = await http
        .get(Uri.parse("http://178.18.247.188:8012/api/clt-prof/"), headers: {
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      // 'Authorization': 'Bearer $cook',
      'Cookie':
          'csrftoken=t8lF7V4TS38mlDOs6vFjrqUNc9zOBQBixDbtk09OX1eGR1aLy4q89tjWlwVNbCz8; sessionid=bql71n8ie03cwgodldnitx9iz1xd87ul'
    });
    //final response = await get(jsonEndpoint);
    print(cook);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      print(json.decode(response.body));
      setState(() {
        firstname = map["data"]["user"]['first_name'];
      });
    } else
      throw Exception(
          'We were not able to successfully download the json data.');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCSRF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2A5B74),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
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
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 110,
                ),
                Text(
                  AppLocalizations.of(context).profile,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Container(
            height: 1000,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Image.asset(
                    "assets/images/Vector.png",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  firstname,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Text(
                    AppLocalizations.of(context).amet,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 100, right: 100, top: 20),
                  child: MaterialButton(
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: const Color(0xff2A5B74),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Eidtprofile()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context).editmyprofile,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
