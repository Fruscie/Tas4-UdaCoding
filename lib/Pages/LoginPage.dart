import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:peternakan/Pages/Register.dart';
import 'package:peternakan/Widget/alert.dart';
import 'package:peternakan/model/user_model.dart';

import 'PageController.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();
  var username, password;
  User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#eeeeee'),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 70),
            Center(
              child: Container(
                height: 230,
                // padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                child: Image.asset('asset/images/farm.png'),
              ),
            ),
            SizedBox(height: 25),
            Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            validator: (value) {
                              return value.isEmpty
                                  ? "Please enter a valid username !! "
                                  : null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: "Username",
                                hintStyle:
                                    TextStyle(color: HexColor('#463333')),
                                labelStyle:
                                    TextStyle(color: HexColor('#463333')),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#463333'),
                                        width: 2.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#463333'),
                                        width: 2.3)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: HexColor('#463333'),
                                  width: 2.3,
                                )),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: HexColor('#463333'),
                                  ),
                                )),
                            onChanged: (value) {
                              username = value;
                            },
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: HexColor('#463333')),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#463333'),
                                        width: 2.3)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor('#463333'),
                                        width: 2.3)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: HexColor('#463333'),
                                  width: 2.3,
                                )),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: HexColor('#463333'),
                                  ),
                                )),
                            obscureText: true,
                            validator: (value) {
                              return value.length < 6
                                  ? "Your password less than 6 characters !!"
                                  : null;
                            },
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ]))),
            SizedBox(height: 40),
            MaterialButton(
                splashColor: HexColor('#00adb5'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: HexColor('#393e46'),
                textColor: Colors.black,
                height: 50,
                minWidth: 250,
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    user.submitDataLogin(username, password).then((value) =>
                        value.toString() == "signIn"
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageControl()))
                            : showAlertDialog(
                                context, 'Username atau Password Salah!!!'));
                    _formKey.currentState.reset();
                  }
                }),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                  _formKey.currentState.reset();
                },
                child: Text(
                  "Belum Punya Akun ? Silahkan Daftar",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.underline),
                )),
          ]),
        ));
  }
}
