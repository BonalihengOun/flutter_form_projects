import 'package:flutter/material.dart';
import 'package:test_flutter_projects/View/category/priceform.dart';
import 'package:test_flutter_projects/View/category/tile.dart';

class PriceTab extends StatelessWidget {
  const PriceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'បន្ទប់',
                          style: TextStyle(fontFamily: 'Niradei'),
                        ),
                      ),
                    ],
                  ),
                  TileCategory(
                    name: 'បន្ទប់ជួលលក្ខណះគ្រួសារ',
                    price: 45,
                  ),
                  TileCategory(
                    name: 'បន្ទប់គ្រែពីរ',
                    price: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'អាហារ',
                          style: TextStyle(fontFamily: 'Niradei'),
                        ),
                      ),
                    ],
                  ),
                  TileCategory(
                    name: 'គុយទាវ ប្រហិត',
                    price: 3.99,
                  ),
                  TileCategory(
                    name: 'បាយពេលព្រឹក',
                    price: 4.00,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'ឧបករណ៏កំសាន្ត',
                          style: TextStyle(fontFamily: 'Niradei'),
                        ),
                      ),
                    ],
                  ),
                  TileCategory(
                    name: 'ម៉ូតូកង់យួន',
                    price: 24.00,
                  ),
                  TileCategory(
                    name: 'ម៉ូតូទឹក',
                    price: 35.00,
                  ),
                  TileCategory(
                    name: 'ទូកកៃយ៉ាក',
                    price: 35.00,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FormText()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Color(0xffDBBA44)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            "Add New",
                            style: TextStyle(
                              fontFamily: "Niradei",
                              color: Color(0xffDBBA44),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: Color(0xffDBBA44),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                                fontFamily: "Niradei", color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
