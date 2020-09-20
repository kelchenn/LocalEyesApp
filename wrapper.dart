import 'package:flutter/material.dart';
import 'package:localeyes_app/main.dart';
import 'package:localeyes_app/screens/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:localeyes_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    int eyes = 0; ///will have to be changed to eyes and level for each user
    int level = 1;

    final user = Provider.of<User>(context);

    //return Home(eyes, level);
    if (user == null){
      return Authenticate();
    } else{
      return Home(eyes, level);  ///will have to be changed to eyes and level for each user
    }

  }
}
