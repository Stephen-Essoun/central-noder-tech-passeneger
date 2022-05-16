import 'package:flutter/material.dart';

TextButton textButton({
  Key? key,
  @required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
  @required String? child,
}) {
  return TextButton(
      onPressed: onPressed,
      style: style,
      child: Text(
        child!,
        style: const TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
      ));
}
