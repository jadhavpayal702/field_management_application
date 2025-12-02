import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dpr/Modal/dpr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DprScreen extends StatefulWidget {
  const DprScreen({super.key, required Map project});

  @override
  State<DprScreen> createState() => _DprScreenState();
}

class _DprScreenState extends State<DprScreen> {
  ImagePicker imagePicker = ImagePicker();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _wheatherController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _countController = TextEditingController();
  List<XFile> selectedImages = [];
  @override
  XFile? selectedImgFile;
  Widget build(BuildContext context) {
    Future<void> pickDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
      );

      if (picked != null) {
        Provider.of<Dpr>(context, listen: false).date = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      }
    }

    Future<void> pickImages() async {
      List<XFile>? images = await imagePicker.pickMultiImage();
      if (images != null) {
        setState(() {
          // Keep only 3 images max
          selectedImages = images.length > 3 ? images.sublist(0, 3) : images;
        });
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 245, 245),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: const Color.fromARGB(255, 81, 80, 80),
          ),
        ),
        title: Text(
          "Daily Progress Report",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "Date",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                //obscureText: true,
                controller: _dateController,
                onTap: pickDate,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month_outlined),

                  hint: Text(
                    "${Provider.of<Dpr>(context).date}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 124, 122, 122),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "Wheather",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _wheatherController,
                decoration: InputDecoration(
                  hint: Text(
                    "${Provider.of<Dpr>(context).wheather}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 124, 122, 122),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                maxLines: 5,

                controller: _descriptionController,
                decoration: InputDecoration(
                  hint: Text(
                    "${Provider.of<Dpr>(context).description}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 124, 122, 122),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "No. of workers",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _countController,
                decoration: InputDecoration(
                  hint: Text(
                    "${Provider.of<Dpr>(context).workerCount}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 124, 122, 122),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Text(
                  "Pick Images",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: selectedImages.isEmpty
                    ? [
                        GestureDetector(
                          onTap: pickImages,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Icon(Icons.add_a_photo),
                          ),
                        ),
                      ]
                    : selectedImages.map((img) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(img.path),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(13),
        child: GestureDetector(
          onTap: () {
            if (_dateController.text.trim().isNotEmpty &&
                _wheatherController.text.trim().isNotEmpty &&
                _descriptionController.text.trim().isNotEmpty &&
                _countController.text.trim().isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text("Data added successfully"),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color.fromARGB(255, 243, 33, 100),
                  content: Text("Complete all fields"),
                ),
              );
            }
            _dateController.clear();
            _wheatherController.clear();
            _descriptionController.clear();
            _countController.clear();
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
