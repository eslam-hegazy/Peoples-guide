import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Auth/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/screens/main_screen.dart';
import 'package:newsapp/screens/splashscreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp/widgets/background.auth.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool ishiden = false;
  TextEditingController Email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

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
                    SizedBox(height: 100),
                    Text(
                      "Login!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 40,
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
                        controller: Email,
                        keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 15),
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
                      alignment: Alignment.centerRight,
                      child: FloatingActionButton(
                        heroTag: null,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Courgette",
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            var result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: Email.text,
                              password: password.text,
                            );
                            if (result != null) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) {
                                return splashscreen();
                              }));
                            } else {
                              print("Not Found");
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      child: Text(
                        "--------------- Or ---------------",
                        style: TextStyle(
                            color: Colors.blue, fontFamily: "Courgette"),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            child: Image.asset("assets/facebook.png"),
                            onPressed: () async {},
                          ),
                          SizedBox(width: 20),
                          FloatingActionButton(
                            heroTag: null,
                            child: Image.asset("assets/google.png"),
                            onPressed: () async {
                              await _handleSignIn();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) {
                                return MainScreen();
                              }));
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Acount?",
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
                                  return Register();
                                }));
                              },
                              child: Text(
                                "Sign Up",
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
