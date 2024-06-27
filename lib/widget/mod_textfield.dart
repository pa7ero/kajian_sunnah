import 'package:flutter/material.dart';

class ModTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final BorderSide colborderside;

  const ModTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.colborderside = BorderSide.none,
  }) : super(key: key);

  @override
  _ModTextFieldState createState() => _ModTextFieldState();
}

class _ModTextFieldState extends State<ModTextField> {
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 40,
      child: TextField(
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.bottom,
        obscureText: _isObscure,
        decoration: InputDecoration(
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: widget.colborderside,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  icon: Icon(
                    _isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                  ),
                  color: Colors.black12,
                )
              : null,
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
        ),
        showCursor: true,
      ),
    );
  }
}
