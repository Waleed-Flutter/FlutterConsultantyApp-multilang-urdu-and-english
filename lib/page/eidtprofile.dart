import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:localization_arb_example/page/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

int id = 1;

class Eidtprofile extends StatefulWidget {
  const Eidtprofile({Key key}) : super(key: key);

  @override
  State<Eidtprofile> createState() => _EidtprofileState();
}

class _EidtprofileState extends State<Eidtprofile> {
  String cookie = "";
  void getCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getString("csrftoken") != "" ||
          sharedPreferences.getString("csrftoken") == null) {
        cookie = sharedPreferences.getString("csrftoken");
        update(
          userController.text.toString(),
          countryController.text.toString(),
          cookie,
        );
      } else {
        print("Not Valid");
      }
    });
  }

  TextEditingController userController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void update(
    String user,
    country,
    cook,
  ) async {
    try {
      String baseimageproduct;
      if (imageFile == null) {
        baseimageproduct == "";
      } else {
        List<int> imageBytesproduct = imageFile.readAsBytesSync();
        baseimageproduct = base64Encode(imageBytesproduct);
      }
      print("base: $baseimageproduct");
      String imageString = '';
      print("string: $imageString");
      String pre = "data:image/jpg;base64,";
      if (baseimageproduct == null) {
        imageString = null;
      } else {
        imageString = "$pre$baseimageproduct";
      }

      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $cook',
      };
      var request = http.Request(
          'PATCH', Uri.parse('http://178.18.247.188:8012/api/clt-prof/'));
      request.body = json.encode({
        "user": {"first_name": user},
        "city": country,
        "phone": "0325",
        "dob": "2022-07-24",
        "gender": "Male",
        "pic": imageString,
      });
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

  File imageFile;
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
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
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).editpro,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 700,
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
                imageFile == null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/Vector.png",
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                height: 115,
                                width: 200,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  fit: StackFit.expand,
                                  children: [
                                    Positioned(
                                        top: 65,
                                        right: -0,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: RawMaterialButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        content: Stack(
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                              width: double
                                                                  .infinity,
                                                              color: Colors
                                                                  .transparent,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: <
                                                                    Widget>[
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        _getFromCamera();
                                                                      },
                                                                      iconSize:
                                                                          20.0,
                                                                      icon:
                                                                          new Icon(
                                                                        Icons
                                                                            .photo_camera,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                  IconButton(
                                                                      iconSize:
                                                                          20.0,
                                                                      onPressed:
                                                                          () {
                                                                        _getFromGallery();
                                                                      },
                                                                      icon:
                                                                          new Icon(
                                                                        Icons
                                                                            .image,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              elevation: 1.0,
                                              fillColor: Color(0xFFF5F6F9),
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                              padding: EdgeInsets.all(6.0),
                                              shape: CircleBorder(),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(imageFile),
                        backgroundColor: Colors.grey,
                        child: Stack(
                          children: [
                            Center(),
                            Container(
                              child: SizedBox(
                                height: 115,
                                width: 200,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  fit: StackFit.expand,
                                  children: [
                                    Positioned(
                                        top: 65,
                                        right: -0,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: RawMaterialButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        content: Stack(
                                                          children: [
                                                            Container(
                                                              height: 40,
                                                              width: double
                                                                  .infinity,
                                                              color: Colors
                                                                  .transparent,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: <
                                                                    Widget>[
                                                                  IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        _getFromCamera();
                                                                      },
                                                                      iconSize:
                                                                          20.0,
                                                                      icon:
                                                                          new Icon(
                                                                        Icons
                                                                            .photo_camera,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                  IconButton(
                                                                      iconSize:
                                                                          20.0,
                                                                      onPressed:
                                                                          () {
                                                                        _getFromGallery();
                                                                      },
                                                                      icon:
                                                                          new Icon(
                                                                        Icons
                                                                            .image,
                                                                        color: Colors
                                                                            .black,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              elevation: 1.0,
                                              fillColor: Color(0xFFF5F6F9),
                                              child: Icon(
                                                Icons.edit,
                                                color: Colors.grey,
                                                size: 18,
                                              ),
                                              padding: EdgeInsets.all(6.0),
                                              shape: CircleBorder(),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  AppLocalizations.of(context).namerhere,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 40, bottom: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                        contentPadding: new EdgeInsets.only(top: 7, left: 20),
                        hintText: AppLocalizations.of(context).changename,
                        hintStyle: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).gender,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: id,
                                onChanged: (index) {}),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context).male,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: id,
                                onChanged: (index) {}),
                            Expanded(
                                child: Text(
                              AppLocalizations.of(context).female,
                              style: TextStyle(fontSize: 16),
                            ))
                          ],
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.16),
                                  blurRadius: 5,
                                  spreadRadius: 4,
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: Center(
                              child: Text(
                            'DD',
                            style: TextStyle(fontSize: 16),
                          ))),
                      Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.16),
                                  blurRadius: 5,
                                  spreadRadius: 4,
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: Center(
                              child: Text(
                            'MM',
                            style: TextStyle(fontSize: 16),
                          ))),
                      Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.16),
                                  blurRadius: 5,
                                  spreadRadius: 4,
                                  offset: const Offset(0, 4),
                                )
                              ]),
                          child: Center(
                              child: Text(
                            'YYYY',
                            style: TextStyle(fontSize: 16),
                          ))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 20, bottom: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff000000).withOpacity(0.16),
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: TextField(
                      controller: countryController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: new EdgeInsets.only(top: 7, left: 20),
                        hintText: AppLocalizations.of(context).country,
                        hintStyle: Theme.of(context).textTheme.headline1,
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
                        borderRadius: BorderRadius.circular(10),
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
                        contentPadding: new EdgeInsets.only(top: 7, left: 20),
                        hintText: AppLocalizations.of(context).pass,
                        hintStyle: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff2A5B74),
                    onPressed: () {
                      getCSRF();
                    },
                    child: Text(
                      AppLocalizations.of(context).savechange,
                      style: Theme.of(context).textTheme.headline2,
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
