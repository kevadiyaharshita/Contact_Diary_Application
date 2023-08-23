import 'package:contact_diary_aaplication/controller/Contact_Controller.dart';
import 'package:contact_diary_aaplication/modal/Contact_Modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});
  String first_name = "";
  String last_name = "";
  String phone = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    Color border_Color = Colors.grey.withOpacity(0.5);
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    Size s = MediaQuery.of(context).size;
    double w = s.width;
    double h = s.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("AddContact"),
        actions: [
          IconButton(
            onPressed: () {
              Contact_Modal c = Contact_Modal(
                First_Name: first_name,
                Last_Name: last_name,
                Email: email,
                Phone: phone,
              );

              bool check =
                  Provider.of<ContactController>(context, listen: false)
                      .addContact(contact: c);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: (check)
                      ? Text("Contect Added Succesfully..")
                      : Text("Failed To Saved..!!"),
                  margin: EdgeInsets.all(10),
                  dismissDirection: DismissDirection.horizontal,
                  duration: Duration(seconds: 2),
                ),
              );
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
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: Icon(
                  Icons.person_3,
                  size: 180,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Add Photo",
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: Color(0xff313131),
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: border_Color),
                      top: BorderSide(width: 0.5, color: border_Color),
                    ),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        //first name
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (val) {
                              first_name = val;
                            },
                            decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: UnderlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            onChanged: (val) {
                              last_name = val.toString();
                            },
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Colors.grey),
                              focusColor: border_Color,
                              enabledBorder: UnderlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              enabledBorder: UnderlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              enabledBorder: UnderlineInputBorder(
                                // borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: border_Color,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
              SingleChildScrollView(
                child: Container(
                  width: w,
                  decoration: BoxDecoration(
                    color: Color(0xff313131),
                    border: Border(
                      bottom: BorderSide(width: 0.5, color: border_Color),
                      top: BorderSide(width: 0.5, color: border_Color),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
