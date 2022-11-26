import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/basic/selectionpage.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({Key? key}) : super(key: key);

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Your Language'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: InkWell(
                onTap: () {
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Card(
                    child: Center(
                        child: Text(
                      'English',
                      style: GoogleFonts.roboto(),
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: GestureDetector(
                onTap: () {
                  var locale = Locale('kn', 'IN ');
                  Get.updateLocale(locale);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectionPage()));
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Card(
                    child: Center(
                        child: Text(
                      'Kannada',
                      style: GoogleFonts.roboto(),
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: InkWell(
                onTap: () {
                  var locale = Locale('hi', 'IN');
                  Get.updateLocale(locale);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SelectionPage()));
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Card(
                    child: Center(
                        child: Text(
                      'Hindi',
                      style: GoogleFonts.roboto(),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
