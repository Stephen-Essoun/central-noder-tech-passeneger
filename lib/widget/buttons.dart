import 'package:flutter/material.dart';

ButtonTheme elevatedButton( 
    {required onpressed,
    Color? textColor,
    Color? color,
    double? borderRadius,
    Text? child}) {
  return ButtonTheme(
    child: ElevatedButton(
        style:  ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )
  ),backgroundColor: MaterialStateProperty.all(color)
        ),

        onPressed: 
           onpressed, child:child,
        ),
  );
}
