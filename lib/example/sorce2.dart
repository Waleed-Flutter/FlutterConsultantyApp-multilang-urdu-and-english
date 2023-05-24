import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:localization_arb_example/page/eidtprofile.dart';
import 'package:localization_arb_example/page/sidepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var headers = {
  'Cookie': 'csrftoken=1dfioAEPy3bIea4Rn5XuY6yfV9w6lpvE0PV6zYCpVBjlfmW7uU6wsByQORBVdciU; sessionid=pyq4wnlr7hgeusre49ufa6iyybsy6072'
};
String firstname ="";
 Future<void> fetchpost() async {
     final response = await http.get(
        Uri.parse("http://178.18.247.188:8012/api/clt-prof/"),
        headers: {
            'Cookie': 'csrftoken=1dfioAEPy3bIea4Rn5XuY6yfV9w6lpvE0PV6zYCpVBjlfmW7uU6wsByQORBVdciU; sessionid=pyq4wnlr7hgeusre49ufa6iyybsy6072'
        });
    //final response = await get(jsonEndpoint);
    print("Main Body");
    print(response.body);
     if (response.statusCode == 200) {
      print("Hello Response");
          Map<String, dynamic> map = json.decode(response.body);
    setState(() {
      firstname = map["data"]["user"]['first_name'];
      print(firstname);
    });
       } else
      throw Exception(
          'We were not able to successfully download the json data.');
     }

  @override
  Widget build(BuildContext context) {
    fetchpost();
    return Scaffold(
        backgroundColor: Color(0xff2A5B74),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 50,right: 20, bottom: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Sidepage())
                    );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 90,),
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
                    padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
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
                    padding: const EdgeInsets.only(left: 100,right: 100,top: 20),
                    child: MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                color: const Color(0xff2A5B74),
                onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Eidtprofile())
                    );
                },
                child:  Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 5,),
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