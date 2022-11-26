import 'package:flutter/material.dart';

Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: ((context) => SizedBox(
            height: 200,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose image',
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
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // ClickImage();
                          },
                          child: Text('Camera')),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // pickImage();
                          },
                          child: Text('Gallery')),
                    ],
                  )
                ],
              ),
            ),
          )));
}
