import 'dart:io';

import 'package:contact_diary_aaplication/controller/Contact_Controller.dart';
import 'package:contact_diary_aaplication/modal/Contact_Modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../controller/Theme_Controller.dart';

class Information_Page extends StatelessWidget {
  Information_Page({super.key});

  // String imagePath = "";
  File? image;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    Contact_Modal cm =
        Provider.of<ContactController>(context).allContactlist[index];

    Color border_Color = Colors.grey.withOpacity(0.5);
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ContactController>(context, listen: false)
                  .editContact(contact: cm, index: index);
              print("Done ${cm.First_Name}");
              print("image : ${cm.image}");
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.done,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: (cm.image != "")
                          ? DecorationImage(
                              image: FileImage(File(cm.image)),
                              fit: BoxFit.cover,
                            )
                          : null,
                      shape: BoxShape.circle,
                      color: Color(0xff9397A3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(2, 2),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: (cm.image == "")
                        ? Text(
                            "${cm.First_Name[0].toUpperCase()}${cm.Last_Name[0].toUpperCase()}",
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        : null),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  child: Text(
                    "Add Photo",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                  ),
                  onPressed: () {
                    ImagePicker picker = ImagePicker();
                    XFile? file;

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Pick Image"),
                        // backgroundColor: Six_Blue,

                        content: Text("Choose the sourse for your image"),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              file = await picker.pickImage(
                                  source: ImageSource.camera);

                              if (file != null) {
                                image = File(file!.path);
                                cm.image = file!.path;
                              }
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Camera",
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              file = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (file != null) {
                                image = File(file!.path);
                                cm.image = file!.path;
                              }

                              Navigator.of(context).pop();
                            },
                            child: Text("Gallary"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: w,
                  child: Form(
                    child: Column(
                      children: [
                        //first name
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            initialValue: cm.First_Name,
                            onChanged: (val) {
                              cm.First_Name = val;
                              print(cm.First_Name);
                            },
                            decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //last name
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            initialValue: cm.Last_Name,
                            onChanged: (val) {
                              cm.Last_Name = val.toString();
                            },
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //phone
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            initialValue: cm.Phone,
                            onChanged: (val) {
                              cm.Phone = val;
                            },
                            decoration: InputDecoration(
                              hintText: "Phone",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //email
                        Padding(
                          padding: EdgeInsets.all(10),
                          // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            initialValue: cm.Email,
                            onChanged: (val) {
                              cm.Email = val;
                            },
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // backgroundColor: Provider.of<Theme_Controller>(context).getTheme
      //     ? Colors.black87
      //     : Colors.grey.shade200,
    );
  }
}
