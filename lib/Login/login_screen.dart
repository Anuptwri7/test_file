import 'dart:convert';
import 'dart:developer';
import 'package:easycare/Branch/branch_API.dart';
import 'package:easycare/Splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();
  TextEditingController branchtextEditingController = TextEditingController();

  bool isChecked = false;
  BranchServices branchServices = BranchServices();
  String dropdownValueBranch = "Select Branch";

  void validateForm() async {
    if (kDebugMode) {
      // log("Json Data Status Code is $dropdownValueBranch");
    }
    if (nametextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Email Address Invalid");
    } else if (passwordtextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is Required.");
    } else if (dropdownValueBranch == "Select Branch") {
      Fluttertoast.showToast(msg: "You have to select branch first");
    } else {
      login();
    }
  }

  final _accesstoken = [];

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  margin:
                      const EdgeInsets.symmetric(vertical: 130, horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -5,
                        blurRadius: 17,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(width: 0.5, color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(18.0),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blueAccent,
                        Color.fromARGB(90, 70, 50, 200),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 30, left: 0, right: 10),
                        child: const Text(
                          "Welcome ! ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Text(
                          "Sign in to Continue.",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        child: FutureBuilder(
                          future: branchServices.fetchBranchApiFromUrl(),
                          // initialData: InitialData,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                            if (snapshot.hasData) {
                              try {
                                final snapshotData = snapshot.data;
                                return DropdownButton<String>(
                                  value: dropdownValueBranch,
                                  icon: const Icon(Icons.arrow_downward,color: Colors.white,),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.white,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValueBranch = newValue!;
                                    });
                                  },
                                  items: snapshotData
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                );
                              } catch (e) {
                                throw Exception(e);
                              }
                            } else {
                              return Text(snapshot.error.toString());
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 30),
                        child: TextField(
                            //key: _formKey ,

                            controller: nametextEditingController,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.drafts_outlined,
                                  color: Color(0xffaf3030)),
                              labelText: "Username",
                              hintText: "Enter your username",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 30),
                        child: TextField(
                            //key: _formKey ,
                            controller: passwordtextEditingController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock, color: Color(0xffaf3030)),
                              labelText: "Password",
                              hintText: "Enter your Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Container(
                              child: Text(
                                "Remember me",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                            onPressed: () async {
                              validateForm();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red.withOpacity(0.7),
                              minimumSize: const Size.fromHeight(45),
                              maximumSize: const Size.fromHeight(50),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 75, right: 30),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(
                                Icons.lock,
                                color: Color(0xffaf3030),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "©2022 Inventory Management System. Powered by: Soori Techs. Pvt. Ltd.",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    var response = await http.post(
      Uri.parse(
          "https://api-soori-ims-staging.dipendranath.com.np/api/v1/user-app/login"),
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json'
      // },
      body: ({
        'user_name': nametextEditingController.text,
        'password': passwordtextEditingController.text,
      }),
    );

    if (response.statusCode == 200) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("access_token",
          json.decode(response.body)['tokens']['access'] ?? '#');
      sharedPreferences.setString("refresh_token",
          json.decode(response.body)['tokens']['refresh'] ?? '#');
      sharedPreferences.setString("user_name", nametextEditingController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      /*if (kDebugMode) {
        log(json.decode(response.body)['detail'].toString());
      }*/
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(json.decode(response.body)['detail'].toString())));
    }
  }
}
