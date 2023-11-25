import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter_projects/model/list.dart';

class FormText extends StatefulWidget {
  const FormText({super.key});

  @override
  State<FormText> createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedType = "ឧបកណ៍";
  List<Item> items = [];
  File? _image;
  Future getImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imgTemp = File(image.path);
    setState(() {
      _image = imgTemp;
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'រូបភាព',
                            style: TextStyle(fontFamily: 'Niradei'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffDBBA44),
                        ),
                      ),
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              child: IconButton(
                                onPressed: () {
                                  getImagePicker();
                                },
                                icon: Icon(Icons.image),
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'ឈ្មោះ',
                            style: TextStyle(fontFamily: 'Niradei'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textname(nameController: _nameController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'ប្រភេទ',
                            style: TextStyle(fontFamily: 'Niradei'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 236, 236, 236)
                              .withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton<String>(
                          items:
                              ['ឧបកណ៍', 'អាហារ', 'បន្ទប់'].map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          value: _selectedType,
                          onChanged: (String? newvalue) {
                            setState(() {
                              _selectedType = newvalue!;
                            });
                          },
                          underline: Container(),
                          focusColor: Colors.amber,
                          padding: EdgeInsets.all(8),
                          isExpanded: true,
                          style: TextStyle(
                              fontFamily: 'Niradei',
                              color: Colors.black.withOpacity(0.6)),
                          hint: Text(
                            'ឧបករណ៍កំសាន្ត',
                            style: TextStyle(
                                fontFamily: 'Niradei',
                                color: Colors.black.withOpacity(0.9)),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'តម្លៃ',
                            style: TextStyle(fontFamily: 'Niradei'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ValueWidget(
                      priceController: _priceController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'ព័ត៏មានលំអិត',
                            style: TextStyle(fontFamily: 'Niradei'),
                          ),
                        ),
                      ],
                    ),
                    DescriptionWidget(
                      descriptionController: _descriptionController,
                    ),
                  ],
                ),
                ButtomAddandSave(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required TextEditingController descriptionController,
  }) : _descriptionController = descriptionController;

  final TextEditingController _descriptionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      child: TextField(
        maxLines: 5,
        style: TextStyle(fontSize: 12),
        controller: _descriptionController,
        decoration: InputDecoration(
          hintText: 'Description',
          fillColor: Color.fromARGB(255, 231, 231, 231).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(9),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
    required TextEditingController priceController,
  }) : _priceController = priceController;

  final TextEditingController _priceController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        style: TextStyle(fontFamily: 'Niradei'),
        controller: _priceController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.red, fontSize: 14),
          fillColor: Color.fromARGB(255, 231, 231, 231).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(9),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ButtomAddandSave extends StatefulWidget {
  const ButtomAddandSave({
    super.key,
  });

  @override
  State<ButtomAddandSave> createState() => _ButtomAddandSaveState();
}

class _ButtomAddandSaveState extends State<ButtomAddandSave> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Color(0xffDBBA44)),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
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
                  onTap: () {
                  // Call addItem method
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xffDBBA44),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontFamily: "Niradei",
                          color: Colors.white,
                        ),
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
  }

  // void addItem() {
  //   setState(() {
  //     String name = _FormTextState()._nameController.text;
  //     double price = _FormTextState()._priceController.text as double;

  //     // Clear the text fields after adding an item
  //     _FormTextState()._nameController.clear();
  //     _FormTextState()._priceController.clear();
  //   });
  // }
}

class Textname extends StatelessWidget {
  const Textname({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        style: TextStyle(fontFamily: 'Niradei'),
        controller: _nameController,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 231, 231, 231).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(9),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
