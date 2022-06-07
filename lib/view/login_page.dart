import 'package:flutter/material.dart';
import 'package:geojit_test_app/authentication/login_authentication.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String? errores;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 50,
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              controller: usernameController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.035),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.08),


            RaisedButton(
              onPressed: () {
                LoginAuth.loginCheck(usernameController.text, passwordController.text,
                    context);
              },
              padding: EdgeInsets.all(0.0),
              child:Container(
                color: Colors.black,
                constraints: BoxConstraints(
                    maxWidth: 300.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  "LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}