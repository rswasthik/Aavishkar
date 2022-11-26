import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathoncode/constants/style.dart';
import 'package:image_picker/image_picker.dart';

import '../sidebar/sidebar.dart';

class MyfarmInput extends StatefulWidget {
  const MyfarmInput({Key? key}) : super(key: key);

  @override
  State<MyfarmInput> createState() => _MyfarmInputState();
}

class _MyfarmInputState extends State<MyfarmInput> {
  TextEditingController _namofmachine = TextEditingController();
  TextEditingController vehicleno = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController nameofowner = TextEditingController();

  File? image;
  String? imageurl;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future ClickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  List<String> tags = [];
  List<String> options = [
    'Tractor',
    'Tracked Trator',
    'Farm Truck',
    'Crop Sprayer',
    'Small Tractor',
    'harvester',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Farm Equipment',
          style: GoogleFonts.roboto(),
        ),
      ),
      drawer: sidebar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 0, right: 10, bottom: 25, left: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      // buildShowModalBottomSheet(context);
                      showModalBottomSheet(
                          context: context,
                          builder: ((context) => SizedBox(
                                height: 200,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Choose image',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30)),
                                          GestureDetector(
                                            onTap: (() {
                                              Navigator.pop(context);
                                            }),
                                            child: Icon(
                                              Icons
                                                  .cancel_presentation_outlined,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                ClickImage();
                                              },
                                              child: Text('Camera')),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                pickImage();
                                              },
                                              child: Text('Gallery')),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )));
                    },
                    child: SizedBox(
                      height: 200,
                      width: 700,
                      child: image != null
                          ? Image.file(image!)
                          : Text("No image selected"),
                    ),
                    // child: CircleAvatar(
                    //   radius: 50,
                    //   backgroundColor: Colors.red.shade200,
                    //   child: Icon(
                    //     CupertinoIcons.person_alt_circle,
                    //     color: Colors.red,
                    //     size: 100,
                    //   ),
                    // ),
                  ),
                ),
              ),
              TextFormField(
                controller: _namofmachine,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Enter Name of machine',
                    labelStyle: ktextstyle,
                    hintStyle: ktextstyle,
                    hintText: 'Name',
                    icon: Icon(Icons.person)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name of machine';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: vehicleno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Enter Vehicle No',
                    labelStyle: ktextstyle,
                    hintStyle: ktextstyle,
                    hintText: 'RXXXXXXX',
                    icon: Icon(Icons.numbers)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Vehicle No';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameofowner,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Enter name of owner',
                    hintText: 'Name',
                    labelStyle: ktextstyle,
                    hintStyle: ktextstyle,
                    icon: Icon(Icons.person_outline)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name of owner';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ChipsChoice<String>.multiple(
                  value: tags,
                  onChanged: (val) => setState(() => tags = val),
                  choiceItems: C2Choice.listFrom<String, String>(
                    source: options,
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: price,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'Price Per Hour',
                    labelStyle: ktextstyle,
                    hintStyle: ktextstyle,
                    hintText: 'RXXXXXXX',
                    icon: Icon(Icons.numbers)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Price Per Hour';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: description,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    labelText: 'description',
                    labelStyle: ktextstyle,
                    hintStyle: ktextstyle,
                    hintText: 'RXXXXXXX',
                    icon: Icon(Icons.numbers)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 500,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: ElevatedButton(
                    onPressed: () async {
                      final b = _formKey.currentState!.validate();
                      final ref = FirebaseStorage.instance
                          .ref()
                          .child('machineimage')
                          .child(DateTime.now().toString() + 'jpg');
                      await ref.putFile(image!);
                      imageurl = await ref.getDownloadURL();

                      if (b) {
                        Map<String, dynamic> product = {
                          "id": _auth.currentUser!.uid,
                          "Name of Machine": _namofmachine.text,
                          "Name of Owner": nameofowner.text,
                          "Description": description.text,
                          "vehicle no": vehicleno.text,
                          "price": price.text,
                          "image": imageurl.toString()
                        };

                        FirebaseFirestore.instance
                            .collection("product1")
                            .add(product);
                      } else {
                        print('Empty value');
                      }
                    },
                    child: Text('Save'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
