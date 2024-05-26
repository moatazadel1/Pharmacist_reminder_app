import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final String? hinttext;
  final TextEditingController controller;
  final String? label;
  final Icon? myicon;
  final String? Function(String?)? validator;
  final bool? isDense;
  final bool obscureText;
  final bool suffixIcon;

  const CustomTextForm(
      {super.key,
      this.hinttext,
      required this.controller,
      this.label,
      this.myicon,
      this.validator,
      this.isDense,
      this.obscureText = false,
      this.suffixIcon = false});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.obscureText && _obscureText),
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hinttext,
        isDense: (widget.isDense != null) ? widget.isDense : false,
        prefixIcon: widget.myicon,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        suffixIconConstraints: (widget.isDense != null)
            ? const BoxConstraints(maxHeight: 33)
            : null,
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF295c82)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
