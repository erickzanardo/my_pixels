import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart' as C;
import 'package:flutter/material.dart' as M;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TextField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle style;
  final String hintText;
  final TextStyle hintStyle;
  final bool enabled;
  final int maxLines;
  final int maxLength;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final M.InputBorder androidInputBorder;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onEditingComplete;
  final GestureTapCallback onTap;

  TextField({
    this.controller,
    this.style,
    this.hintText,
    this.hintStyle,
    this.enabled,
    this.maxLines,
    this.maxLength,
    this.textInputAction,
    this.keyboardType,
    this.textAlign,
    this.androidInputBorder,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return C.CupertinoTextField(
        controller: controller,
        style: style,
        placeholder: hintText,
        placeholderStyle: hintStyle ??
            const TextStyle(
              fontWeight: FontWeight.w400,
              color: C.CupertinoColors.placeholderText,
            ),
        enabled: enabled,
        maxLines: maxLines,
        maxLength: maxLength,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.start,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
      );
    } else {
      return M.TextField(
        controller: controller,
        style: style,
        decoration: M.InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          border: androidInputBorder,
        ),
        enabled: enabled,
        maxLines: maxLines,
        maxLength: maxLength,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        textAlign: textAlign ?? TextAlign.start,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
      );
    }
  }
}
