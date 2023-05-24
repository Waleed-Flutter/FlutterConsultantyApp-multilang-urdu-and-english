import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Contectpag extends StatefulWidget {
  const Contectpag({Key key}) : super(key: key);

  @override
  State<Contectpag> createState() => _ContectpagState();
}

class _ContectpagState extends State<Contectpag> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void signup(
    String name,
    email,
    message,
  ) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://178.18.247.188:8012/api/clt-cont/'));
      request.body = json.encode({
        "name": name,
        "email": email,
        "msg": message,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Message Send Successfuly"),
          backgroundColor: Colors.green,
        ));

        // setState(() {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Welcome()));
        // });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "not send",
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
          Column(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xff2A5B74),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 50, right: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context).contactus,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 450,
                width: 330,
                decoration: const BoxDecoration(
                    color: Color(0xff2A5B74),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(180.0))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 30, right: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.call,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '03001234567',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'abc@gmail.com',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.of(context).street,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    new EdgeInsets.only(left: 10, bottom: 4),
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context).namea,
                                hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: const Color(0xff999999),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding:
                                    new EdgeInsets.only(left: 10, bottom: 4),
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context).email,
                                hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: const Color(0xff999999),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                contentPadding:
                                    new EdgeInsets.only(left: 10, bottom: 4),
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context).message,
                                hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: const Color(0xff999999),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff000000).withOpacity(0.16),
                                blurRadius: 5,
                                spreadRadius: 4,
                                offset: const Offset(0, 4),
                              )
                            ]),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          color: const Color(0xff2A5B74),
                          onPressed: () {
                            if (nameController.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Please enter your Username"),
                                backgroundColor: Colors.red,
                              ));
                            } else if (emailController.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Please enter your password"),
                                backgroundColor: Colors.red,
                              ));
                            } else if (messageController.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Please enter your Email"),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              signup(
                                  nameController.text.toString(),
                                  emailController.text.toString(),
                                  messageController.text.toString());
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context).sendmessage,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
