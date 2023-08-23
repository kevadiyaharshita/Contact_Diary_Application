import 'package:contact_diary_aaplication/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/Theme_Controller.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(MyRoutes.home);
    });

    return Scaffold(
      body: Center(
        child: Image(
          image: (Provider.of<Theme_Controller>(context).getTheme)
              ? AssetImage('assets/images/Contact us (2).gif')
              : AssetImage('assets/images/Contact us.gif'),
        ),
      ),
    );
  }
}
