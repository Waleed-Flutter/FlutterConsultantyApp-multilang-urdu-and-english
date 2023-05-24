import 'package:flutter/material.dart';
import 'package:localization_arb_example/provider/langchange.dart';
import 'package:provider/provider.dart';

class Eleva extends StatefulWidget {
  const Eleva({Key key}) : super(key: key);

  @override
  State<Eleva> createState() => _ElevaState();
}

class _ElevaState extends State<Eleva> {
  var buttonText = 'arabic';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                                onPressed: () {
                  
                  setState(() {
                    buttonText = 'English';
                    context
                                .read<LanguageChangeProvider>()
                                .changeLocale("en");
                  });
                                },
                                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                                child: Text(buttonText));
  }
}