import 'package:contact_diary_aaplication/controller/Contact_Controller.dart';
import 'package:contact_diary_aaplication/controller/Theme_Controller.dart';
import 'package:contact_diary_aaplication/modal/Contact_Modal.dart';
import 'package:contact_diary_aaplication/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MyRoutes.home);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("HomePage"),
        actions: [
          Consumer<Theme_Controller>(
            builder: (context, provider, child) => IconButton(
              onPressed: () {
                provider.change_Theme();
              },
              icon: provider.getTheme
                  ? Icon(Icons.light_mode)
                  : Icon(Icons.dark_mode),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
            child: Consumer<ContactController>(
          builder: (context, pro, _) => pro.allContactlist.isNotEmpty
              ? ListView.separated(
                  itemCount: pro.allContactlist.length + 1,
                  itemBuilder: (context, index) {
                    Contact_Modal c_m = (index > 0)
                        ? pro.allContactlist[index - 1]
                        : pro.allContactlist[index];

                    return (index == 0)
                        ? Text(
                            "Contacts",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        : ListTile(
                            title: Text("${c_m.First_Name}"),
                            subtitle: Text(c_m.Phone),
                          );
                  },
                  separatorBuilder: (context, index) => Divider(),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/No data-pana.png'),
                              fit: BoxFit.fill)),
                    ),
                    Text("No Contact Found !!"),
                    Text("Click on + Button to add Contact"),
                  ],
                ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.AddContact);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
