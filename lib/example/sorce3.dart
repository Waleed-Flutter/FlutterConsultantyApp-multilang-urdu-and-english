import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:localization_arb_example/example/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({Key key}) : super(key: key);

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  String cookie = "";
  void setCSRF() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      cookie = sharedPreferences.getString("csrftoken");

      print(cookie);
    });
  }

  Future<List<Datum>> fetchData() async {
    final response = await http.get(
        Uri.parse("http://178.18.247.188:8012/api/clt-serv-full/"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6ImFsaXFhaXNlcjIyMTQiLCJleHAiOjE2NjI1NDIyNDMsImVtYWlsIjoiYWxpcWFpc2VyMjIxNEBnbWFpbC5jb20ifQ.h5oegXU75tfhO69Cw55mtghEOJjUi1aFrDvRwXrsSqk',
        });
    print("cook: $cookie");
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("object");
      return jsonResponse.map((data) => new Datum.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<Datum>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
    setCSRF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView'),
      ),
      body: Center(
        child: FutureBuilder<List<Datum>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      color: Colors.white,
                      child: Center(
                        child: Text(data[index].name),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class CustomListView extends StatefulWidget {
  final List<Spacecraft> spacecrafts;

  CustomListView(this.spacecrafts);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.spacecrafts.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(widget.spacecrafts[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Spacecraft spacecraft, BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff1A3023),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  spacecraft.status,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      " User Name: " + spacecraft.status,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      spacecraft.status,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Event Date: " + spacecraft.status,
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
