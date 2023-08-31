import 'package:contact_diary_aaplication/controller/Theme_Controller.dart';
import 'package:contact_diary_aaplication/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/Contact_Controller.dart';
import '../../modal/Contact_Modal.dart';
import '../../utils/color_utils.dart';

class Detail_Page extends StatelessWidget {
  Detail_Page({super.key});

  call({required String number}) async {
    Uri uri = Uri(
      scheme: 'tel',
      path: number,
    );

    await launchUrl(uri);
  }

  sms({required String number}) async {
    Uri uri = Uri(
      scheme: 'sms',
      path: number,
    );
    await launchUrl(uri);
  }

  email({required String emailLink}) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: emailLink,
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;

    Contact_Modal cm =
        Provider.of<ContactController>(context).allContactlist[index];

    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Provider.of<Theme_Controller>(context).getTheme
            ? Colors.black
            : Colors.grey.shade200,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.Info_Page, arguments: index);
              },
              icon: Icon(Icons.edit)),
          SizedBox(
            width: 5,
          ),
          IconButton(
              onPressed: () {
                Provider.of<ContactController>(context, listen: false)
                    .deleteContact(index: index);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
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
                  child: Text(
                    "${cm.First_Name[0].toUpperCase()}${cm.Last_Name[0].toUpperCase()}",
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "${cm.First_Name} ${cm.Last_Name}",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Message
                  GestureDetector(
                    onTap: () {
                      sms(number: cm.Phone);
                    },
                    child: Container(
                      width: 85,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<Theme_Controller>(context).getTheme
                            ? dark_theme1
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.messenger_rounded,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "Message",
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      call(number: cm.Phone);
                    },
                    child: Container(
                      width: 85,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<Theme_Controller>(context).getTheme
                            ? dark_theme1
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "Call",
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ),

                  //Email
                  GestureDetector(
                    onTap: () {
                      email(emailLink: cm.Email);
                    },
                    child: Container(
                      width: 85,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<Theme_Controller>(context).getTheme
                            ? dark_theme1
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ),

                  // share
                  GestureDetector(
                    onTap: () async {
                      await Share.share(cm.Phone);
                    },
                    child: Container(
                      width: 85,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Provider.of<Theme_Controller>(context).getTheme
                            ? dark_theme1
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueAccent),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: w,
                height: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Provider.of<Theme_Controller>(context).getTheme
                      ? dark_theme1
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "name",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${cm.First_Name} ${cm.Last_Name}",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                    Divider(
                      color: Provider.of<Theme_Controller>(context).getTheme
                          ? null
                          : Colors.grey.shade300,
                    ),
                    Text(
                      "mobile",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${cm.Phone} ",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                    Divider(
                      color: Provider.of<Theme_Controller>(context).getTheme
                          ? null
                          : Colors.grey.shade300,
                    ),
                    Text(
                      "email",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${cm.Email}",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Provider.of<Theme_Controller>(context).getTheme
          ? Colors.black
          : Colors.grey.shade200,
    );
  }
}
