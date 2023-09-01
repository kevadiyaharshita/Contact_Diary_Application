import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:contact_diary_aaplication/controller/Contact_Controller.dart';
import 'package:contact_diary_aaplication/modal/Contact_Modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import '../../controller/Theme_Controller.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});
  String firstName = "";
  String lastName = "";
  String phone = "";
  String email = "";
  String imagePath = "";
  File? image;

  @override
  Widget build(BuildContext context) {
    Color border_Color = Colors.grey.withOpacity(0.5);
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    Size s = MediaQuery.of(context).size;
    double w = s.width;
    double h = s.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("AddContact"),
          actions: [
            IconButton(
              onPressed: () {
                Contact_Modal c = Contact_Modal(
                  First_Name: firstName,
                  Last_Name: lastName,
                  Email: email,
                  Phone: phone,
                  image: imagePath,
                );

                bool check =
                    Provider.of<ContactController>(context, listen: false)
                        .addContact(contact: c);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: (check)
                        ? Text("Contect Added Succesfully..")
                        : Text("Failed To Saved..!!"),
                    // margin: EdgeInsets.all(10),
                    dismissDirection: DismissDirection.horizontal,
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.done),
            ),
          ],
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: (imagePath != "")
                        ? DecorationImage(
                            image: FileImage(File(imagePath)),
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
                  child: (imagePath == "")
                      ? Icon(
                          CupertinoIcons.person_solid,
                          color: Colors.white,
                          size: 180,
                        )
                      : null,
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
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
                                imagePath = file!.path;
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
                                imagePath = file!.path;
                              }

                              Navigator.of(context).pop();
                            },
                            child: Text("Gallary"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Add Photo",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: w,
                    decoration: BoxDecoration(
                        // color: Provider.of<Theme_Controller>(context).getTheme
                        //     ? Color(0xff313131)
                        //     : Colors.white,
                        // border: Border(
                        //   bottom: BorderSide(width: 0.5, color: border_Color),
                        //   top: BorderSide(width: 0.5, color: border_Color),
                        // ),
                        ),
                    child: Form(
                      child: Column(
                        children: [
                          //first name
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              onChanged: (val) {
                                firstName = val;
                              },
                              decoration: InputDecoration(
                                hintText: "First Name",
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
                                    width: 0.5,
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
                              onChanged: (val) {
                                lastName = val.toString();
                              },
                              decoration: InputDecoration(
                                hintText: "Last Name",
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
                                    width: 0.5,
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
                              onChanged: (val) {
                                phone = val;
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
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              onChanged: (val) {
                                email = val;
                              },
                              decoration: InputDecoration(
                                hintText: "Email Name",
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
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Provider.of<Theme_Controller>(context).getTheme
        //     ? null
        //     : Colors.grey.shade200,
      ),
    );
  }
}
