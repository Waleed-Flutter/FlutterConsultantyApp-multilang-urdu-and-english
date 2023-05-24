import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({Key key}) : super(key: key);

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                    padding: const EdgeInsets.only(left: 20,right: 20, top: 50),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Dashboard())
                    );
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
                    AppLocalizations.of(context).aboutus,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 30),
                    child: Text(
                        AppLocalizations.of(context).lipsome,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        ),
                  ),
                  SizedBox(height: 20,),
                  Image.asset("assets/images/Map.png",height: 150,),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
