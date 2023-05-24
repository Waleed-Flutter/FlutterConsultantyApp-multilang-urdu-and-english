import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:localization_arb_example/page/forget_page.dart';
import 'package:localization_arb_example/page/signup.dart';
import 'package:localization_arb_example/provider/langchange.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

var cookies;

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void setCSRF(
    String token,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("csrftoken", token);

    print("Token Saved" + sharedPreferences.getString("csrftoken"));
  }

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse('http://178.18.247.188:8012/api/clt-login/'),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        if (data['status'] == 'success') {
          // var cookie = response.headers['set-cookie'];
          // var arr = cookie.split(';');
          // print(cookie);
          // print(arr[0]);
          // final authToken = cookies[1].split(';');
          // print(authToken);
          // Map<String, dynamic> map =
          //     json.decode(response.headers['set-cookie']);
          Map<String, dynamic> data =
              new Map<String, dynamic>.from(json.decode(response.body)).cast();
          print("hello");
          print(data['data']['token']);
          setCSRF(data['data']['token']);
          print(response.body.toString());
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Successfuly"),
            backgroundColor: Colors.green,
          ));

          setState(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Invalid username or password",
            ),
            backgroundColor: Colors.red,
          ));
        }
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Image.asset(
                "assets/images/ifpo.png",
                height: 150,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 3),
                child: Text(
                  AppLocalizations.of(context).sign,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2A5B74),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                controller: userController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: new EdgeInsets.only(top: 17),
                  hintText: AppLocalizations.of(context).name,
                  hintStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: new EdgeInsets.only(top: 17),
                  hintText: AppLocalizations.of(context).pass,
                  hintStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forget()));
                  },
                  child: Text(
                    AppLocalizations.of(context).forget,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              color: const Color(0xff2A5B74),
              onPressed: () {
                if (userController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter your Email"),
                    backgroundColor: Colors.red,
                  ));
                } else if (passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter your password"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  login(userController.text.toString(),
                      passwordController.text.toString());
                }
              },
              child: Text(
                AppLocalizations.of(context).login,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text(
                  AppLocalizations.of(context).create,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text('English'),
                onTap: () {
                  context.read<LanguageChangeProvider>().changeLocale("en");
                },
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                child: Text('العربية'),
                onTap: () {
                  context.read<LanguageChangeProvider>().changeLocale("ar");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
