import 'package:flutter/material.dart';
import 'package:menu/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? fontSize;
  final double? height;
  final Color? color;

  const ButtonWidget(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.width = 300,
      this.fontSize = 18,
      this.height = 50,
      this.color = const Color.fromARGB(255, 240, 23, 95)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minWidth: width,
        height: height,
        color: color,
        onPressed: onPressed,
        child:
            TextRegular(text: label, fontSize: fontSize!, color: Colors.white));
  }
}
