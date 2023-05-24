import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/dashboard.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 38),
                        child: Row(
                          children: [
                            Image.asset("assets/images/Circle Background.png"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        AppLocalizations.of(context).welcome,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30, left: 30, top: 30),
                        child: Text(
                          AppLocalizations.of(context).itisa,
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
                        child: MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
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
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50, bottom: 100),
                  child: Image.asset("assets/images/Illustration.png"),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
