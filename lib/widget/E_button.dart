import 'package:flutter/material.dart';

class Ebutton extends StatelessWidget {
  final String text;
  final void Function()? onpress;
  final Color btncolor;
  final Color? txtcolor;

  Ebutton({
    required this.text,
    this.onpress,
    required this.btncolor,
    this.txtcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        fixedSize: Size(340, 40),
        backgroundColor: btncolor,
      ),
      onPressed: onpress,
      child: Text(
        text,
        style: TextStyle(color: txtcolor),
      ),
    );
  }
}
