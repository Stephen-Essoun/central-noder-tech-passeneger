import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final bool? obscure;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  String? Function(String?)? validator;

  // ignore: use_key_in_widget_constructors
  TextFormFieldWidget({
    this.obscure,
    this.labelText,
    this.onChanged,
    this.validator,
    this.textInputType,
    this.controller,
    this.functionValidate,
    this.parametersValidate,
    this.actionKeyboard = TextInputAction.next,
    this.onSubmitField,
    this.onFieldTap,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Theme.of(context).primaryColor,
      ),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: widget.textInputType,
        textInputAction: widget.actionKeyboard,
        style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          enabledBorder:const OutlineInputBorder(
              borderSide:
                   BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 1.2,
          ),
          contentPadding: EdgeInsets.only(
              top: 12, bottom: bottomPaddingToError, left: 8.0, right: 8.0),
          isDense: true,
          errorStyle: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            letterSpacing: 1.2,
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).secondaryHeaderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        controller: widget.controller,
        validator: widget.validator,
        onFieldSubmitted: (value) {
          if (widget.onSubmitField != null) widget.onSubmitField!();
        },
        onTap: () {
          if (widget.onFieldTap != null) widget.onFieldTap!();
        },
      ),
    );
  }
}

String? commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
