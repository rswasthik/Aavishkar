import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathoncode/constants/style.dart';
import 'package:hackathoncode/ui/basic/selectionpage.dart';

import '../SideBarWidgets/MyfarmInput.dart';

class sidebar extends StatelessWidget {
  const sidebar({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(child: Image.asset('assets/Images/farmerbg.png')),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: Colors.black,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.landscape_rounded),
                title: Text(
                  'My Farm',
                  style: ktextstyle,
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => MyFarm(),
                  //     ));
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'My Farm Equipment',
                  style: ktextstyle,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyfarmInput(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(
                  'Favorite',
                  style: ktextstyle,
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => favorite(),
                  //     ));
                },
              ),
              Divider(
                height: 1,
                color: Colors.black,
                thickness: 0.3,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: ktextstyle,
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => profile(),
                  //     ));
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                  'Share',
                  style: GoogleFonts.roboto(),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(
                  'About Us',
                  style: GoogleFonts.roboto(),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => aboutus(),
                  //     ));
                },
              ),
              Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Setting',
                  style: ktextstyle,
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => setting(),
                  //     ));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text(
                  'Log Out',
                  style: GoogleFonts.roboto(),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectionPage()));
                },
              ),
            ],
          ),
        ),
      );
}
