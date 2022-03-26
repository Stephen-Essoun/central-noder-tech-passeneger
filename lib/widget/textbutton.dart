  import 'package:flutter/material.dart';

TextButton textButton({
    Key? key,
    @required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    @required Widget? child,
    }){return TextButton(onPressed: onPressed,
     child: child!);}