import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
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
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        CustomTextField(title: "Name", hint: "Adly wagdy"),
                        SizedBox(height: 15),
                        CustomTextField(
                          title: "Phone number",
                          hint: "01013489760",
                        ),
                        SizedBox(height: 15),
                        CustomTextField(
                          title: "Password",
                          hint: "******",
                          obscureText: true,
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

                              onPressed: () {},
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String title;
  final String hint;
  bool obscureText;
  CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.obscureText = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isprivate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TextStyle(color: Colors.grey)),
        TextFormField(
          obscureText: widget.obscureText,
          obscuringCharacter: ".",
          decoration: InputDecoration(
            hint: Text(widget.hint),
            suffixIcon: isprivate || widget.obscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                        isprivate = true;
                      });
                    },
                    child: widget.obscureText
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.visibility_off),
                  )
                : null,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
