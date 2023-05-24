import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_arb_example/page/eidtprofile.dart';
import 'package:localization_arb_example/page/sidepage.dart';
import 'package:localization_arb_example/provider/langchange.dart';
import 'package:provider/provider.dart';

class Language1 extends StatefulWidget {
  const Language1({Key key}) : super(key: key);

  @override
  State<Language1> createState() => _Language1State();
}

class _Language1State extends State<Language1> {
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
                        MaterialPageRoute(builder: (context) => Sidepage()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  AppLocalizations.of(context).language,
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
                SizedBox(height: 80,),
                Text(AppLocalizations.of(context).selectlanguage,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                      width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff2A5B74)),
                      onPressed: () {
                        context.read<LanguageChangeProvider>().changeLocale("en");
                      },
                      child: Text(
                        'English',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                      )),
                ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        
                  style: ElevatedButton.styleFrom(primary: Color(0xff2A5B74)),
                      onPressed: () {
                        context.read<LanguageChangeProvider>().changeLocale("ar");
                      },
                      child: Text(
                        'العربية',
                         
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                      )),
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
