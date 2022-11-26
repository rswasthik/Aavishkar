import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathoncode/ui/widgets/BannerWidget.dart';

import '../../../widgets/productdetails/Tractor.dart';
import '../../../widgets/productdetails/harrow.dart';
import '../../../widgets/productdetails/potato.dart';
import '../../../widgets/productdetails/thresher.dart';
import '../sidebar/sidebar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("product2").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "Name of Machine": qn.docs[i]["Name of Machine"],
          "Description": qn.docs[i]["Description"],
          "price": qn.docs[i]["price"],
          "Name of Owner": qn.docs[i]["Name of Owner"],
          "image": qn.docs[i]["image"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => notification(),
                //     ));
              },
              icon: Icon(Icons.notifications)),
        ],
        title: Text(
          'HOME',
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: sidebar(),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerWidget(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://bl-i.thgim.com/public/incoming/3kt6qx/article65627135.ece/alternates/FREE_1200/TAFE_Tractor.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Tractor',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Amithhh',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
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
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9980.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    GestureDetector(
                                      onTap: null,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            tractor()),
                                                  );
                                                },
                                                child: Text('View'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://www.wheeltractor.com/uploads/allimg/110709/1-110F92140401Z.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Potato harvester',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Ganesh',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '27 Nov 2022 at 1:56 AM',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9900.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    GestureDetector(
                                      onTap: null,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            potato(),
                                                      ));
                                                },
                                                child: Text('View'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://5.imimg.com/data5/BR/GO/BW/SELLER-84591706/single-crop-wheat-thresher-500x500.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Thresher',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'raghu',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '27 Nov 2022 at 2:36 AM',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9980.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    GestureDetector(
                                      onTap: null,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            thresher(),
                                                      ));
                                                },
                                                child: Text('View'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://5.imimg.com/data5/UO/UH/MY-9547167/rotary-tiller-500x500.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Rotary tiller',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Saathwick',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '27 Nov 2022 at 4:36 AM',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9900.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    GestureDetector(
                                      onTap: null,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            tractor(),
                                                      ));
                                                },
                                                child: Text('View'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://bl-i.thgim.com/public/incoming/3kt6qx/article65627135.ece/alternates/FREE_1200/TAFE_Tractor.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Tractor',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Madhava',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'ID',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '789456AB',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
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
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9980.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    GestureDetector(
                                      onTap: null,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text('View'))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://bl-i.thgim.com/public/incoming/3kt6qx/article65627135.ece/alternates/FREE_1200/TAFE_Tractor.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'Tractor',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Amithhh',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
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
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9980.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => tractor(),
                                              ));
                                        },
                                        child: Text('View'))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Disc Plaough
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: Container(
                        width: 400,
                        height: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 13.0, 8.0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 50.0,
                                    width: 60.0,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        'https://m.media-amazon.com/images/I/71jSx88Go9L._SX522_.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6.0, 0, 0),
                                        child: Text(
                                          'DISC Harrow',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Karthick',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'ID',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '7894561AB',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Uploaded On',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '27 Nov 2022 at 5:36 AM',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'TOTAL AMOUNT',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    Text(
                                      '\u20B9800.00 Per Hour',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: .2,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Icon(Icons.favorite_border),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      harrow()));
                                        },
                                        child: Text('View'))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //       builder: (context) => GoogleMaps(),
      //     //     ));
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.navigation),
      // ),
    );
  }

  // Expanded Productcard(BuildContext context) {
  //   return Expanded(
  //     child: GridView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: _products.length,
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2, childAspectRatio: 1),
  //         itemBuilder: (_, index) {
  //           return GestureDetector(
  //             onTap: () => Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (_) => ProductDetails(_products[index]))),
  //             child: Card(
  //               elevation: 3,
  //               child: Column(
  //                 children: [
  //                   AspectRatio(
  //                       aspectRatio: 2,
  //                       child: Container(
  //                           color: Colors.yellow,
  //                           child: Image.network(
  //                             _products[index]["product-img"][0],
  //                           ))),
  //                   Text("${_products[index]["Name of Machine"]}"),
  //                   Text("${_products[index]["price"].toString()}"),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }),
  //   );
  // }
}
