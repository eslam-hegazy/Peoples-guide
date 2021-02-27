import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Auth/login.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:newsapp/screens/splashscreen.dart';

import 'package:newsapp/widgets/background.auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool ishiden = false;
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          background_auth(),
          Container(
            height: size.height * 0.95,
            width: size.width * 0.80,
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 85),
                    Text(
                      "Register!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "PottaOne",
                        color: Color(0xFF2661FA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 36),
                    Card(
                      borderOnForeground: true,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: Name,
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                          hintStyle: TextStyle(fontFamily: "Courgette"),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 6),
                    Card(
                      borderOnForeground: true,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: Phone,
                        enableSuggestions: true,
                        decoration: InputDecoration(
                          hintText: "Enter Your Phone",
                          hintStyle: TextStyle(fontFamily: "Courgette"),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Phone";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Card(
                      borderOnForeground: true,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: Email,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email",
                          hintStyle: TextStyle(fontFamily: "Courgette"),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Email";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: password,
                        obscureText: ishiden,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontFamily: "Courgette"),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                ishiden = !ishiden;
                              });
                            },
                            icon: Icon(
                              ishiden ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          if (_formkey.currentState.validate()) {
                            var result = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: Email.text,
                              password: password.text,
                            );
                            if (result != null) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) {
                                return MainScreen();
                              }));
                              print("sucess");
                            } else {
                              print("erorr");
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Courgette",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You have an Acount?",
                              style: TextStyle(
                                  color: Color(0xFFF98A2A),
                                  fontFamily: "Courgette",
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return login();
                                }));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: "Courgette",
                                  color: Color(0xFF6C33FA),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
