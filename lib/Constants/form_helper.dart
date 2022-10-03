import 'package:flutter/material.dart';

class DynamicForm extends StatelessWidget {
  final String? keyName;
  final Function onValidate;
  final Function onSaved;
  final String initialValue = "";
  final bool obscureText;
  final double fontSize;
  final double hintFontSize;
  final double padding;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color borderColor;
  final Color borderFocusColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final double enabledBorderWidth;
  final bool showPrefixIcon;
  final Color prefixIconColor;
  final bool isMultiline;
  final Function? onChange;
  final Color textColor;
  final Color hintColor;
  final Color validationColor;
  final double contentPadding;
  final int multilineRows;
  final bool isNumeric;
  final Color backgroundColor;

  const DynamicForm(
      {super.key,
      this.padding = 10,
      this.backgroundColor = Colors.transparent,
      this.borderColor = Colors.black,
      this.borderFocusColor = Colors.blue,
      this.borderRadius = 10,
      this.borderWidth = 2,
      this.contentPadding = 6,
      this.enabledBorderWidth = 1,
      this.focusedBorderWidth = 2,
      this.fontSize = 16,
      this.hintColor = Colors.grey,
      this.hintFontSize = 15,
      this.isMultiline = false,
      this.isNumeric = false,
      this.keyName,
      this.multilineRows = 2,
      this.obscureText = false,
      this.onChange,
      required this.onSaved,
      required this.onValidate,
      this.prefixIcon,
      this.prefixIconColor = Colors.blue,
      this.showPrefixIcon = false,
      this.suffixIcon,
      this.textColor = Colors.black,
      this.validationColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        initialValue: initialValue,
        key: Key(initialValue.toString()),
        obscureText: obscureText,
        keyboardType: isNumeric ? TextInputType.number : null,
        maxLines: isMultiline ? multilineRows : 1,
        validator: (value) {
          return onValidate(value);
        },
        onSaved: (value) {
          return onSaved(value);
        },
        onChanged: (value) {
          return onChange != null ? onChange!(value) : null;
        },
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: backgroundColor,
          contentPadding: EdgeInsets.all(contentPadding),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: hintFontSize,
            color: hintColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: enabledBorderWidth,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderFocusColor,
              width: focusedBorderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: showPrefixIcon
              ? Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconTheme(
                    data: IconThemeData(color: prefixIconColor),
                    child: prefixIcon!,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
