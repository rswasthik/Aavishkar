import 'package:flutter/material.dart';

import '../../../../components/news_list_tile.dart';
import '../../../../models/news_model.dart';
import '../sidebar/sidebar.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AgriNews',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: sidebar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
                NewsData.recentNewsData.map((e) => NewsListTile(e)).toList(),
          ),
        ),
      ),
    );
  }
}
