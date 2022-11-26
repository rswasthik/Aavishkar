import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Images_strings.dart';
import 'Login/login.dart';
import 'SignUp/signuppage.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage(farmertractor),
                height: size.height * 0.3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to',
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              Text('Raithara Sahayaka'.tr,
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                'The App that connects you to farming resources'.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => signuppage()));
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.roboto(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text('Log in',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 3.0, color: Colors.black),
                        fixedSize: const Size(120, 15),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
