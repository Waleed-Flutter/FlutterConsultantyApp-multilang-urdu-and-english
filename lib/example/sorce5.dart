import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos
  List _loadedPhotos = [];
  String cookie = "";
  void setCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      cookie = sharedPreferences.getString("csrftoken");

      print(cookie);
    });
  }

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'http://178.18.247.188:8012/api/clt-serv-full/';

    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFsaXFhaXNlcjIyMTQiLCJleHAiOjE2NjI1NDIyNDMsImVtYWlsIjoiYWxpcWFpc2VyMjIxNEBnbWFpbC5jb20ifQ.h5oegXU75tfhO69Cw55mtghEOJjUi1aFrDvRwXrsSqk',
    });

    final data = json.decode(response.body);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCSRF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
        ),
        body: SafeArea(
            child: _loadedPhotos.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _fetchData,
                      child: const Text('Load Photos'),
                    ),
                  )
                // The ListView that displays photos
                : ListView.builder(
                    itemCount: _loadedPhotos.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return ListTile(
                        title: Text(_loadedPhotos[index]["status"]),
                        subtitle:
                            Text('Photo ID: ${_loadedPhotos[index]["status"]}'),
                      );
                    },
                  )));
  }
}
