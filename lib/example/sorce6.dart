import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localization_arb_example/example/model_1.dart';

class Fwtch extends StatefulWidget {
  const Fwtch({Key key}) : super(key: key);

  @override
  State<Fwtch> createState() => _FwtchState();
}

class _FwtchState extends State<Fwtch> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Model1>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          snapshot.data.data[index].id
                                              .toString(),
                                          style: TextStyle(fontSize: 20)),
                                      Text(
                                          snapshot.data.data[index].name
                                              .toString(),
                                          style: TextStyle(fontSize: 20)),
                                      Text(
                                          snapshot.data.data[index].status
                                              .toString(),
                                          style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
