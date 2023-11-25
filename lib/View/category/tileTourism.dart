import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TileTourism extends StatefulWidget {
  const TileTourism(
      {super.key,
      required this.name,
      required this.descritption,
      required this.location});
  final String name;
  final String descritption;
  final String location;
  @override
  State<TileTourism> createState() => _TileTourismState();
}

class _TileTourismState extends State<TileTourism> {
  @override
  Widget build(BuildContext context) {
    File? _image;

    Future getImagePicker() async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        _image = imgTemp;
      });
    }

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
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
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(fontFamily: 'Niradei', fontSize: 12),
                        ),
                        Text(
                          widget.descritption,
                          maxLines: 7,
                          style: TextStyle(
                              fontFamily: 'Niradei',
                              color: const Color.fromARGB(255, 144, 144, 144),
                              fontSize: 8),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 20,
                            ),
                            Center(
                              child: Text(
                                widget.location,
                                style: TextStyle(
                                    fontFamily: 'Niradei',
                                    color: const Color.fromARGB(
                                        255, 144, 144, 144),
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        )
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
