import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/consultation.dart';
import 'package:localization_arb_example/page/facilities.dart';
import 'package:localization_arb_example/page/feaslbility.dart';
import 'package:localization_arb_example/page/industrial.dart';
import 'package:localization_arb_example/page/iso.dart';
import 'package:localization_arb_example/page/login.dart';
import 'package:localization_arb_example/page/signup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
enum _values {
  facilities,
  feaslbility,
  iso,
  industrial,
  consultation,
}

class Drop extends StatefulWidget {
  const Drop({Key key}) : super(key: key);

  @override
  State<Drop> createState() => _DropState();
}

class _DropState extends State<Drop> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Flutter Dropdown Button Tutorial"),
        ),
        body:Container(
          padding: EdgeInsets.all(20),
          child:DropdownButton<_values>(
            items: [
              DropdownMenuItem(
                child: Text(AppLocalizations.of(context).facilitiesrequest,),
                value: _values.facilities,
              ),
              DropdownMenuItem(
                child: Text(AppLocalizations.of(context).feasibilitystudy,),
                value: _values.feaslbility,
              ),
              DropdownMenuItem(
                child: Text(AppLocalizations.of(context).iso,),
                value: _values.iso,
              ),
              DropdownMenuItem(
                child: Text(AppLocalizations.of(context).industrialcertificates,),
                value: _values.industrial,
              ),
              DropdownMenuItem(
                child: Text(AppLocalizations.of(context).consultation,),
                value: _values.consultation,
              ),
            ],
            
            onChanged: (value) {
               switch (value) {
              case _values.facilities:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Facilities()));
                break;
              case _values.feaslbility:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Feaslbility()));
                break;
              case _values.iso:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Iso()));
                break;
                case _values.industrial:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Industrial()));
                break;
                case _values.consultation:
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => Consultation()));
                break;
            }
            },
            hint:Text("Select item")
            ),
          )
        );
  }
}