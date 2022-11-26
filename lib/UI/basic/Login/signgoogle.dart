import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class signwithgoogle extends StatelessWidget {
  const signwithgoogle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'OR',
          style: GoogleFonts.roboto(),
        ),
        Padding(
          padding: EdgeInsets.all(14.0),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
                onPressed: () async {
                  print('click');
                },
                icon: Icon(Icons.login_outlined),
                label: Text(
                  'Sign With Google',
                  style: GoogleFonts.roboto(),
                )),
          ),
        )
      ],
    );
  }
}
