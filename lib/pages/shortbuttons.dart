import 'package:flutter/material.dart';

ElevatedButton shortButton ({
  Key? key,
  required void Function()? onPressed,
  void Function(bool)? onHover,
  void Function(bool)? onFocusChange,
  ButtonStyle? style,Color? color,
  Clip clipBehavior = Clip.none,
  required Widget? child,
}){
  return ElevatedButton(
    onPressed: onPressed, child:child,
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
    );
}