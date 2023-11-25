import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:test_flutter_projects/model/list.dart';

class InfoTab extends StatefulWidget {
  const InfoTab({super.key});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _PriceController = TextEditingController();
  final TextEditingController _DiscountController = TextEditingController();
  final TextEditingController _AddressController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  Future getImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imgTemp = File(image.path);
    setState(() {
      _image = imgTemp;
    });
  }

  Future getImagePicker1() async {
    final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image1 == null) return;
    final imgTemp1 = File(image1.path);
    setState(() {
      _image1 = imgTemp1;
    });
  }

  Future getImagePicker2() async {
    final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image2 == null) return;
    final imgTemp = File(image2.path);
    setState(() {
      _image2 = imgTemp;
    });
  }

  Future getImagePicker3() async {
    final image3 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image3 == null) return;
    final imgTemp = File(image3.path);
    setState(() {
      _image3 = imgTemp;
    });
  }

  Future getImagePicker4() async {
    final image4 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image4 == null) return;
    final imgTemp = File(image4.path);
    setState(() {
      _image4 = imgTemp;
    });
  }

  String _selectedType = "សៀមរាប";
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Photos Gallary',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Color.fromARGB(255, 186, 186, 186),
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
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 186, 186, 186),
                          ),
                        ),
                        child: _image1 != null
                            ? Image.file(
                                _image1!,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                child: IconButton(
                                  onPressed: () {
                                    getImagePicker1();
                                  },
                                  icon: Icon(Icons.plus_one),
                                ),
                              ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 186, 186, 186),
                          ),
                        ),
                        child: _image2 != null
                            ? Image.file(
                                _image2!,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                child: IconButton(
                                  onPressed: () {
                                    getImagePicker2();
                                  },
                                  icon: Icon(Icons.plus_one),
                                ),
                              ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 186, 186, 186),
                          ),
                        ),
                        child: _image3 != null
                            ? Image.file(
                                _image3!,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                child: IconButton(
                                  onPressed: () {
                                    getImagePicker3();
                                  },
                                  icon: Icon(Icons.plus_one),
                                ),
                              ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.21,
                        height: MediaQuery.of(context).size.height * 0.12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 186, 186, 186),
                          ),
                        ),
                        child: _image4 != null
                            ? Image.file(
                                _image4!,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                child: IconButton(
                                  onPressed: () {
                                    getImagePicker4();
                                  },
                                  icon: Icon(Icons.plus_one),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Name',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Nameform(NameController: _NameController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Price',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Priceform(PriceController: _PriceController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Discount',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Discountform(DiscountController: _DiscountController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Province',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.05,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  items: ['សៀមរាប', 'កណ្តាល', 'បាត់ដំបង'].map((String item) {
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Address',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            AddressForm(AddressController: _AddressController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Location',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02),
                  child: TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: 'Your Location',
                      hintStyle: TextStyle(fontSize: 12),
                      fillColor:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                      filled: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_pin),
                    color: Color(0xffDBBA44),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Description',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DescriptionWidget(descriptionController: _descriptionController),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Social Contact',
                    style: TextStyle(fontFamily: 'Niradei'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: IntlPhoneField(
                    style: TextStyle(fontSize: 12),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      fillColor: Colors.white,
                      labelText: 'Phone Number',
                      prefixStyle: TextStyle(fontSize: 12),
                      labelStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    languageCode: "en",
                    onChanged: (phone) {},
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.02),
                  decoration: BoxDecoration(
                    color: Color(0xffDBBA44),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'lib/assets/pic/add.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
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
                      // Call addItem method
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: Color(0xffDBBA44),
                        borderRadius: BorderRadius.all(Radius.circular(14)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
    required TextEditingController AddressController,
  }) : _AddressController = AddressController;

  final TextEditingController _AddressController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: _AddressController,
        decoration: InputDecoration(
          hintText: 'Your Location',
          hintStyle: TextStyle(fontSize: 12),
          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

class Discountform extends StatelessWidget {
  const Discountform({
    super.key,
    required TextEditingController DiscountController,
  }) : _DiscountController = DiscountController;

  final TextEditingController _DiscountController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: _DiscountController,
        decoration: InputDecoration(
          hintText: '\$0.00',
          hintStyle: TextStyle(fontSize: 12),
          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
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

class Priceform extends StatelessWidget {
  const Priceform({
    super.key,
    required TextEditingController PriceController,
  }) : _PriceController = PriceController;

  final TextEditingController _PriceController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: _PriceController,
        decoration: InputDecoration(
          hintText: '\$0.00',
          hintStyle: TextStyle(fontSize: 12),
          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
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

class Nameform extends StatelessWidget {
  const Nameform({
    super.key,
    required TextEditingController NameController,
  }) : _NameController = NameController;

  final TextEditingController _NameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: _NameController,
        decoration: InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(fontSize: 12),
          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
          filled: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.text,
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
        maxLines: 7,
        style: TextStyle(fontSize: 12),
        controller: _descriptionController,
        decoration: InputDecoration(
          hintText: 'Description',
          fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
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
