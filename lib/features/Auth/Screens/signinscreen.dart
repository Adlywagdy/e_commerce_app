/*
Signup screen with: email , name,password,confirm password
and use validator on each textfield , also use all border styles for textformfield
 */

import 'package:e_commerce_app/core/extensions/stringextension.dart';
import 'package:e_commerce_app/core/widgets/customtextfield.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? thepassword;
  String? theconfirmpassword;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xffDCDCDC),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  "Welcome to our grocery shop",
                  style: TextStyle(fontSize: 30, fontWeight: .w700),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    autovalidateMode: .onUserInteraction,
                    key: formkey,
                    child: Column(
                      children: [
                        CustomTextField(
                          title: "Name",
                          hint: "Adly wagdy",
                          isrequired: Isrequired.required,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return "this field is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        CustomTextField(
                          title: "Phone number",
                          hint: "01013489760",
                          isrequired: Isrequired.optional,
                        ),
                        SizedBox(height: 15),

                        CustomTextField(
                          title: "Email",
                          hint: "Adly@gmail.com",
                          isrequired: Isrequired.required,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return "this field is required";
                            } else if (email.isemailvalid() == false) {
                              return "this email isn't valid";
                            } else {
                              return null;
                            }
                          },
                        ),

                        SizedBox(height: 15),
                        CustomTextField(
                          onChanged: (password) {
                            thepassword = password;
                            print("Password is $thepassword");
                          },
                          title: "Password",
                          hint: "******",
                          isrequired: Isrequired.required,
                          obscureText: true,
                          validator: (pass) {
                            if (pass == null || pass.isEmpty) {
                              return "this field is required";
                            } else if (pass.length < 5) {
                              return "password should be 5 letters atleast ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        CustomTextField(
                          onChanged: (password) {
                            theconfirmpassword = password;
                            print("confirmPassword is $theconfirmpassword");
                          },
                          title: "Confirm Password",
                          isrequired: .required,
                          hint: "******",
                          obscureText: true,
                          validator: (pass) {
                            if (pass == null || pass.isEmpty) {
                              return "this field is required";
                            } else if (pass.length < 5) {
                              return "password should be 5 letters atleast ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 20, fontWeight: .bold),
                            ),
                            IconButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  ContinuousRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      16,
                                    ),
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.green,
                                ),

                                minimumSize: WidgetStatePropertyAll(
                                  Size(50, 15),
                                ),
                              ),

                              onPressed: () {
                                print("confirmPassword is $theconfirmpassword");
                                print("Password is $thepassword");
                                if (formkey.currentState!.validate() &&
                                    thepassword == theconfirmpassword) {
                                  print("true");

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("confirmed")),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("not confirmed"),
                                    ),
                                  );
                                  print("false");
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Log in",
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
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
    );
  }
}
