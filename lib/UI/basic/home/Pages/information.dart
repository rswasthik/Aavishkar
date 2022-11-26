import 'package:flutter/material.dart';
import 'package:hackathoncode/constants/style.dart';

import '../sidebar/sidebar.dart';

class information extends StatefulWidget {
  const information({super.key});

  @override
  State<information> createState() => _informationState();
}

class _informationState extends State<information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: sidebar(),
      body: Center(
        child: Text(
          'No favorite',
          style: ktextstyle,
        ),
      ),
    );
  }
}
