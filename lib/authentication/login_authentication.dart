import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geojit_test_app/view/home_page.dart';

class LoginAuth {
 static void loginCheck(String username, String password, BuildContext context) {
    if (username.isEmpty) {
      //errores = "Invalid Username";
    } else if (password.isEmpty) {
     // errores = "Invalid Password";
    } else if (username.isEmpty && password.isEmpty) {
    //  errores = "Invalid UserName and Password";
    } else {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }
  }
}