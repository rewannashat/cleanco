import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? autofocus;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final String? hintTxt;
  final TextStyle? hintStyle;
  final double? radius;
  final Color? colorBorder;
  final Color? colorBorderEnable;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  const CustomTextField({

    this.autofocus = false,
    @required this.controller,
    @required this.backgroundColor,
    @required this.hintTxt,
    @required this.hintStyle,
    @required this.radius,
    @required this.colorBorder,
    @required this.colorBorderEnable,
    @required this.textAlign,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.keyboardType,
    @required this.validator,
  }) ;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius!),
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.colorBorder!,
        ),
      ),
      child: TextFormField(
        autofocus: widget.autofocus!,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign!,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
          hintText: widget.hintTxt,
          hintStyle: widget.hintStyle,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
        validator: widget.validator,
      ),
    );
  }
}
