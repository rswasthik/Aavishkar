import 'package:flutter/material.dart';

import '../sidebar/sidebar.dart';

class overproductioncrops extends StatefulWidget {
  const overproductioncrops({super.key});

  @override
  State<overproductioncrops> createState() => _overproductioncropsState();
}

class _overproductioncropsState extends State<overproductioncrops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Over crops Production ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: sidebar(),
    );
  }
}
