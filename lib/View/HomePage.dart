import 'package:flutter/material.dart';
import 'package:test_flutter_projects/View/Moretourism/%E1%9E%94%E1%9E%93%E1%9F%92%E1%9E%90%E1%9F%82%E1%9E%98%E1%9E%8F%E1%9F%86%E1%9E%94%E1%9E%93%E1%9F%8B%E1%9E%91%E1%9F%81%E1%9E%9F%E1%9E%85%E1%9E%8E%E1%9F%8F.dart';
import 'package:test_flutter_projects/View/category/tile.dart';
import 'package:test_flutter_projects/View/category/tileTourism.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'បញ្ចីតំបន់ទេសចណ៍',
          style: TextStyle(fontSize: 18, fontFamily: 'Niradei'),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TileTourism(
                  name: 'Learn Archery at Royal Archery',
                  descritption:
                      'ជារមណីយដ្ឋានប្រណិតដែលមានទេសភាពស្រស់ខ្យល់អាកាសបរិសុទ្ធ និង ហុំព័ទ្ធដោយភ្នំ',
                  location: 'សៀមរាប'),
              SizedBox(
                height: 15,
              ),
              TileTourism(
                  name: 'ICE Wake Park',
                  descritption:
                      'ជារមណីយដ្ឋានប្រណិតដែលមានទេសភាពស្រស់ខ្យល់អាកាសបរិសុទ្ធ និង ហុំព័ទ្ធដោយភ្នំ',
                  location: 'បាត់ដំបង'),
              SizedBox(
                height: 15,
              ),
              TileTourism(
                  name: 'Quad Adventure Cambodia',
                  descritption:
                      'ជារមណីយដ្ឋានប្រណិតដែលមានទេសភាពស្រស់ខ្យល់អាកាសបរិសុទ្ធ និង ហុំព័ទ្ធដោយភ្នំ',
                  location: 'កំពត'),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoreTourism()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                      color: Color(0xffDBBA44),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Text(
                      "Add New",
                      style:
                          TextStyle(fontFamily: "Niradei", color: Colors.white),
                    ),
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
