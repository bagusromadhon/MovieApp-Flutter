import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/forgot.dart';
import 'package:flutter_application_1/screens/Login/components/background.dart';
import 'package:flutter_application_1/screens/Signup/signup_screen.dart';
import 'package:flutter_application_1/components/already_have_an_account_acheck.dart';
import 'package:flutter_application_1/components/rounded_button.dart';
import 'package:flutter_application_1/components/rounded_input_field.dart';
import 'package:flutter_application_1/components/rounded_password_field.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/components/text_field_container.dart';
import 'package:flutter_application_1/constants.dart';

class Body extends StatefulWidget {
  

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
   bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child:Form(
          key:_formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            // RoundedInputField(
            //   hintText: "Your Email",
            //   onChanged: (value) {},
            // ),

            
          TextFormField(
                controller: emailController,
                cursorColor: Color(0xFF6F35A5),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1E6FF),
                  hintText: 'Email',

                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                  // icon: Icon(

                  //   color: Color(0xFF6F35A5),
                  // ),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.length == 0) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),

              TextFormField(
                obscureText: _isObscure3,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure3? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isObscure3 = !_isObscure3;
                        });
                      }),
                  filled: true,
                  fillColor: Color(0xFFF1E6FF),
                  hintText: 'Password',
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 15.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color(0xFFF1E6FF)),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (!regex.hasMatch(value)) {
                    return ("please enter valid password min. 6 character");
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
      // TextField(
      //   obscureText: true,
      //   // onChanged: widget.onChanged,
      //   cursorColor: kPrimaryColor,
      //   decoration: InputDecoration(
      //     hintText: "Password",
      //     icon: Icon(
      //       Icons.lock,
      //       color: kPrimaryColor,
      //     ),
      //     suffixIcon: Icon(
      //       Icons.visibility,
      //       color: kPrimaryColor,
      //     ),
      //     border: InputBorder.none,
      //   ),
      // ),

            // RaisedButton(
            //   color: Color(0xFF6F35A5),
            //   textColor: Colors.white,
            //  onPressed: (){
            //    Navigator.of(context).pushReplacement(
            //      MaterialPageRoute(builder: (context)=> Forgotpass())
            //    );
            //  },
            //  child:Text("Forgot Password......",
            // style: TextStyle(
            // color: Colors.white,
            //                   fontSize: 18,
            //                   decoration: TextDecoration.underline,
            // ), 
            // )
            // ),
            
            MaterialButton(
              shape:RoundedRectangleBorder(borderRadius:
              BorderRadius.all(Radius.circular(20.0))
               ),
               elevation: 5.0,
               height: 40,
               color: Color(0xFF6F35A5),
              onPressed:(){
                setState(() {
                  visible = true;
                });
                signIn(
                  emailController.text, passwordController.text
                );
              } ,
              child: Text("login",
              style: TextStyle(
                fontSize: 20,
                color:Colors.white,
              ),
              ),
              ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
  
  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}