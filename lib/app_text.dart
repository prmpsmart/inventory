import 'package:flutter/material.dart';
import './theme.dart';

class AppText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? fontSize;
  final TextOverflow overflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;

  const AppText(
    this.text, {
    this.maxLines,
    Key? key,
    this.color = AppColorPallete.black,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Karla',
      ),
    );
  }
}
