import 'package:flutter/material.dart';
import 'package:test_flutter_projects/View/Moretourism/Price.dart';
import 'package:test_flutter_projects/View/Moretourism/Youtube.dart';
import 'package:test_flutter_projects/View/Moretourism/infoScreen.dart';

class MoreTourism extends StatefulWidget {
  const MoreTourism({super.key});

  @override
  State<MoreTourism> createState() => _MoreTourismState();
}

class _MoreTourismState extends State<MoreTourism> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Add your back button logic here
              Navigator.pop(context);
              print('Back button pressed!');
            },
          ),
          title: Text(
            'បន្លែមតំបន់ទេសចណ៍',
            style: TextStyle(fontSize: 18, fontFamily: 'Niradei'),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              labelStyle: TextStyle(fontFamily: 'Niradei'),
              labelColor: Color(0xffDBBA44),
              indicatorColor: Color(0xffDBBA44),
              tabs: [
                Tab(
                  text: 'info',
                ),
                Tab(
                  text: 'Youtube',
                ),
                Tab(
                  text: 'Price',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  InfoTab(),
                  YouTubePlay(),
                  PriceTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
