import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Neumorphic(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Raitara \n sahayaka",
                      style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                blurRadius: 10,
                                color: Colors.red,
                                offset: Offset(0, 0)),
                            Shadow(
                                blurRadius: 10,
                                color: Colors.red,
                                offset: Offset(0, 0)),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        width: 200,
                        height: 150,
                        child: Image.asset("assets/Images/farmerbg.png")),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Farmers Assistant",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                blurRadius: 10,
                                color: Colors.red,
                                offset: Offset(0, 0)),
                            Shadow(
                                blurRadius: 10,
                                color: Colors.red,
                                offset: Offset(0, 0)),
                          ]),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: NeumorphicButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => hire(),
              //               ));
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.all(4.0),
              //           child: Text(
              //             "Hire",
              //             style: TextStyle(
              //                 fontSize: 25,
              //                 color: Colors.white,
              //                 shadows: [
              //                   Shadow(
              //                       blurRadius: 10,
              //                       color: Colors.red,
              //                       offset: Offset(0, 0)),
              //                   Shadow(
              //                       blurRadius: 10,
              //                       color: Colors.red,
              //                       offset: Offset(0, 0)),
              //                 ]),
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: NeumorphicButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => rent(),
              //               ));
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.all(4.0),
              //           child: Text(
              //             "Rent",
              //             style: TextStyle(
              //                 fontSize: 25,
              //                 color: Colors.white,
              //                 shadows: [
              //                   Shadow(
              //                       blurRadius: 10,
              //                       color: Colors.red,
              //                       offset: Offset(0, 0)),
              //                   Shadow(
              //                       blurRadius: 10,
              //                       color: Colors.red,
              //                       offset: Offset(0, 0)),
              //                 ]),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
