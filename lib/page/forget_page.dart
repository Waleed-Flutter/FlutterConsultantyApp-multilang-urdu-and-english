import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:localization_arb_example/page/login.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Forget extends StatefulWidget {
  const Forget({Key key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10,right: 10),
              child: Row(
                children:  [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Login())
                    );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children:  [
                  Text(
                    AppLocalizations.of(context).forgotpassword,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    child: Text(
                      AppLocalizations.of(context).provideyour,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20,top: 40),
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
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: const Color(0xff2A5B74),
                onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Dashboard())
                    );
                },
                child:  Text(
                  AppLocalizations.of(context).next,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
