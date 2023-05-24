import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/consultation.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:localization_arb_example/page/facilities.dart';
import 'package:localization_arb_example/page/feaslbility.dart';
import 'package:localization_arb_example/page/industrial.dart';
import 'package:localization_arb_example/page/iso.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum _values {
  facilities,
  feaslbility,
  iso,
  industrial,
  consultation,
}

class Service extends StatefulWidget {
  const Service({Key key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  int selectedRadio;
  bool navigateToPage = false;
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
                                builder: (context) => Dashboard()));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      AppLocalizations.of(context).ourservices,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<_values>(
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  AppLocalizations.of(context).facilitiesrequest,
                                ),
                                value: _values.facilities,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  AppLocalizations.of(context).feasibilitystudy,
                                ),
                                value: _values.feaslbility,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  AppLocalizations.of(context).iso,
                                ),
                                value: _values.iso,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  AppLocalizations.of(context)
                                      .industrialcertificates,
                                ),
                                value: _values.industrial,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  AppLocalizations.of(context).consultation,
                                ),
                                value: _values.consultation,
                              ),
                            ],
                            onChanged: (value) {
                              switch (value) {
                                case _values.facilities:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => Facilities()));
                                  break;
                                case _values.feaslbility:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => Feaslbility()));
                                  break;
                                case _values.iso:
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (c) => Iso()));
                                  break;
                                case _values.industrial:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => Industrial()));
                                  break;
                                case _values.consultation:
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (c) => Consultation()));
                                  break;
                              }
                            },
                            
                            
                            dropdownColor: Colors.white,
                            hint: Text(
                              AppLocalizations.of(context).pleaseselect,
                              style: TextStyle(),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










