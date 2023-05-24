import 'dart:convert';
import 'dart:developer';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/page/login.dart';
import 'package:localization_arb_example/page/welcome.dart';
import 'package:localization_arb_example/provider/langchange.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void signup(
    String username,
    password,
    email,
    mobile,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://178.18.247.188:8012/api/clt-reg/'));
      request.body = json.encode({
        "user": {
          "name": username,
          "email": email,
          "password": password,
          "password2": password,
        },
        "dob": "2022-07-25",
        "phone": mobile,
        "gender": "Male"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Account Created Successfuly"),
          backgroundColor: Colors.green,
        ));

        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Welcome()));
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Invalid Email",
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
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            "assets/images/ifpo.png",
            height: 120,
            width: 240,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
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
                  hintText: AppLocalizations.of(context).namea,
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
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: new EdgeInsets.only(top: 17),
                  hintText: AppLocalizations.of(context).email,
                  hintStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: const Icon(Icons.mail),
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
                controller: mobileController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: new EdgeInsets.only(top: 17),
                  hintText: AppLocalizations.of(context).mobile,
                  hintStyle: Theme.of(context).textTheme.headline1,
                  prefixIcon: const Icon(Icons.call),
                ),
              ),
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
                    content: Text("Please enter your Username"),
                    backgroundColor: Colors.red,
                  ));
                } else if (passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter your password"),
                    backgroundColor: Colors.red,
                  ));
                } else if (emailController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter your Email"),
                    backgroundColor: Colors.red,
                  ));
                } else if (mobileController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter your Mobile Number"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  signup(
                      userController.text.toString(),
                      passwordController.text.toString(),
                      emailController.text.toString(),
                      mobileController.text.toString());
                }
              },
              child: Text(
                AppLocalizations.of(context).create,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
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
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              AppLocalizations.of(context).socialmedia,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/acebook.png"),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/images/witer.png"),
              const SizedBox(
                width: 10,
              ),
              Image.asset("assets/images/oogle.png"),
            ],
          ),
        ],
      ),
    );
  }
}
