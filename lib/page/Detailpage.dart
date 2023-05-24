import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localization_arb_example/example/model_1.dart';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/page/Ourservice.dart';

class Detailpage extends StatelessWidget {
  Future<Model1> getProductsApi() async {
    final response = await http.get(
        Uri.parse('http://178.18.247.188:8012/api/clt-serv-full/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFsaXFhaXNlcjIyMTQiLCJleHAiOjE2NjI1NDIyNDMsImVtYWlsIjoiYWxpcWFpc2VyMjIxNEBnbWFpbC5jb20ifQ.h5oegXU75tfhO69Cw55mtghEOJjUi1aFrDvRwXrsSqk',
        });
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Model1.fromJson(data);
    } else {
      return Model1.fromJson(data);
    }
  }

  final Data data;
  Detailpage(this.data);
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
                                builder: (context) => Ourservice()));
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
                      "Detail Page",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${data.id}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.status,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.desc,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.created,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      data.updated,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '${data.addedby}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// Text(data.status);