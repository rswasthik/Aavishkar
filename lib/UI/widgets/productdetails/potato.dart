import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class potato extends StatefulWidget {
  const potato({Key? key}) : super(key: key);

  @override
  State<potato> createState() => _potatoState();
}

class _potatoState extends State<potato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Potato Harvester'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 700,
                height: 200,
                child: Image.network(
                    'https://www.wheeltractor.com/uploads/allimg/110709/1-110F92140401Z.jpg'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                      child: Text(
                        'Potato Harvester',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Ganesh',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'TOTAL AMOUNT',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 6.0, 0, 0),
                      child: Text(
                        'Uploaded On',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '28 Nov 2022 at 1:36 AM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '\u20B9900.00 Per Hour',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text(
                            'Your Successfully Booked !!! Waiting For Confiramation'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('Book'))),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Key Specification',
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 340,
              child: Card(
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 100,
                      child: Card(
                        elevation: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Icon(Icons.battery_charging_full_outlined),
                              Text('HP'),
                              Text('60 HP'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: 100,
                      child: Card(
                        elevation: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Icon(Icons.battery_charging_full_outlined),
                              Text('Capacity'),
                              Text('3882 CC'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: Card(
                        child: Card(
                          elevation: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Icon(Icons.battery_charging_full_outlined),
                                Text('Cyclinder'),
                                Text('4 Cyclinder'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: GoogleFonts.roboto(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 340,
              child: Card(
                elevation: 10,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row(
                      children: [Text('Nothing to Show!!')],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
