import 'package:flutter/material.dart';
import 'package:localization_arb_example/page/complainthist.dart';
import 'package:localization_arb_example/page/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Complaints extends StatefulWidget {
  const Complaints({Key key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).complaints,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Complainthist())
                    );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Color(0xff2A5B74),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('11',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                            Text('JUNE',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                            Text('2022',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CODE:PU100322-129384847',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text(AppLocalizations.of(context).dear,
                      style: TextStyle(
                      ),
                      ),
                      Text(AppLocalizations.of(context).lorem,
                      style: TextStyle(
                      ),
                      ),
                      Row(
                        children: [
                          Text(AppLocalizations.of(context).mattis,
                          style: TextStyle(
                      ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                          color: Color(0xff8AC44B),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                        ),
                          ),
                        ],
                      ),
                      Text(AppLocalizations.of(context).status,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff2A5B74),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(AppLocalizations.of(context).granted,
                          style: TextStyle(
                        color: Colors.white,
                      ),
                          ),
                        ),
                      ),
                      Text(AppLocalizations.of(context).seedetails,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    
    
            Divider(
              thickness: 3,
            ),
    
    
    
            
            InkWell(
              onTap: (){
                Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Complainthist())
                    );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Color(0xff2A5B74),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('11',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                            Text('JUNE',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                            Text('2022',
                            style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CODE:PU100322-129384847',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text(AppLocalizations.of(context).dear,
                      style: TextStyle(
                      ),
                      ),
                      Text(AppLocalizations.of(context).lorem,
                      style: TextStyle(
                      ),
                      ),
                      Row(
                        children: [
                          Text(AppLocalizations.of(context).mattis,
                          style: TextStyle(
                      ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                          color: Color(0xff8AC44B),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                        ),
                          ),
                        ],
                      ),
                      Text(AppLocalizations.of(context).status,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(AppLocalizations.of(context).ungranted,
                          style: TextStyle(
                        color: Colors.white,
                      ),
                          ),
                        ),
                      ),
                      Text(AppLocalizations.of(context).seedetails,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    
    
            Divider(
              thickness: 3,
            ),
    
            
    
    
          ],
        ),
    );
  }
}