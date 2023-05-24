import 'dart:convert';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/example/model_1.dart';
import 'package:localization_arb_example/page/Detailpage.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ourservice extends StatefulWidget {
  const Ourservice({Key key}) : super(key: key);

  @override
  State<Ourservice> createState() => _OurserviceState();
}

String cookie = "";
void getCSRF() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  cookie = sharedPreferences.getString("csrftoken");
  print(cookie);
}

class _OurserviceState extends State<Ourservice> {
  Future<Model1> getProductsApi() async {
    final response = await http.get(
        Uri.parse('http://178.18.247.188:8012/api/clt-serv-full/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $cookie',
        });
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Model1.fromJson(data);
    } else {
      return Model1.fromJson(data);
    }
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff2A5B74),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text(
                      AppLocalizations.of(context).ourservices,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<Model1>(
                  future: getProductsApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            Data data = snapshot.data.data[index];

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: Text(
                                      snapshot.data.data[index].name.toString(),
                                      style: TextStyle(fontSize: 20)),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Detailpage(data)));
                                  },
                                ),
                              ),
                            );
                            // return Column(
                            //   children: [
                            //     SizedBox(
                            //       height: 20,
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //           left: 20, right: 20),
                            //       child: Container(
                            //         height: 60,
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         child: Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 20, right: 20),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Text(
                            //                   snapshot.data.data[index].name
                            //                       .toString(),
                            //                   style: TextStyle(fontSize: 20)),
                            //               Icon(
                            //                 Icons.arrow_forward_ios,
                            //                 size: 20,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
