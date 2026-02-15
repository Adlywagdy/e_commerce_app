import 'package:flutter/material.dart';

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
