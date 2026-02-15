import 'package:flutter/material.dart';

enum Isrequired { required, optional }

class CustomTextField extends StatefulWidget {
  final String title;
  final String hint;
  final Isrequired isrequired;
  void Function(String?)? onSaved;
  void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  bool obscureText;
  CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.isrequired = Isrequired.optional,
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
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.isrequired == Isrequired.required
              ? widget.validator
              : null,
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
