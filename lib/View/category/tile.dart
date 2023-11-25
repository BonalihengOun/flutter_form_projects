import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter_projects/View/category/priceform.dart';
import 'package:test_flutter_projects/model/list.dart';

class TileCategory extends StatefulWidget {
  const TileCategory({super.key, required this.name, required this.price});
  final String name;
  final double price;
  @override
  State<TileCategory> createState() => _TileCategoryState();
}

class _TileCategoryState extends State<TileCategory> {
  File? _image;

  Future getImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imgTemp = File(image.path);
    setState(() {
      _image = imgTemp;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              getImagePicker();
                            },
                            icon: Icon(Icons.image),
                          ),
                        ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(fontFamily: 'Niradei'),
                        ),
                        Text(
                          '\$' + widget.price.toString(),
                          style: TextStyle(
                              fontFamily: 'Niradei', color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FormText()),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Color(0xffDBBA44)),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16))),
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
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            decoration: BoxDecoration(
                                                color: Color(0xffDBBA44),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16))),
                                            child: Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    fontFamily: "Niradei",
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: Image.asset('lib/assets/pic/dots.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ItemManager {
//   List<Item> items = [];

//   void addItem(Item newItem) {
//     items.add(newItem);
//   }

//   void deleteItem(int index) {
//     items.removeAt(index);
//   }
// }
//  ItemManager itemManager = ItemManager();