import 'package:flutter/material.dart';

import 'forgotpasswordbtn.dart';

class ForgotpasswwordScreen {
  static Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: ((context) => Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Make Selection',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                        }),
                        child: Icon(
                          Icons.cancel_presentation_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Select one of the options give below to reset your password',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15)),
                  SizedBox(
                    height: 30,
                  ),
                  ForgetButtonWidget(
                    onTap: () {},
                    btnIcon: Icons.email_outlined,
                    title: 'EMail',
                    subtitle: 'Reset via Email Verificaion',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ForgetButtonWidget(
                    onTap: () {},
                    btnIcon: Icons.phone_android_outlined,
                    title: 'Phone No',
                    subtitle: 'Reset via Phone no',
                  )
                ],
              ),
            )));
  }
}
