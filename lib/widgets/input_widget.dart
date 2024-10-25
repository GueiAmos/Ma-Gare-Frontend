import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../configs/colors_config.dart';

class WdgTextField extends StatefulWidget {
  final String? labelText, hintText;
  final TextEditingController controller;
  final bool requis, underline, obscureText;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final double borderRadius;
  final Color? labelColor, borderColor, iconColor, textColor, inputColor;

  const WdgTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.requis = false,
    this.underline = false,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.labelColor = Colors.black,
    this.borderRadius = 30,
    this.borderColor = Colors.black,
    this.iconColor = Colors.black,
    this.inputColor = Colors.transparent,
    this.textColor = Colors.black,
    this.prefixIcon,
  });

  @override
  State<WdgTextField> createState() => _WdgTextFieldState();
}

class _WdgTextFieldState extends State<WdgTextField> {
  late bool obscureText;
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    InputBorder modelInputBorder() {
      return widget.underline
          ? UnderlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: widget.borderColor!))
          : OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: widget.borderColor!),
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius)),
            );
    }

    return TextFormField(
      style: TextStyle(
          color: widget.textColor, fontWeight: FontWeight.w500, fontSize: 16),
      cursorColor: widget.textColor,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      obscureText: widget.obscureText ? visibility : false,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        labelText: widget.labelText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: widget.labelColor),
        hintText: widget.hintText,
        errorStyle: TextStyle(
            color: GColor.orange, fontWeight: FontWeight.w600, fontSize: 16),
        filled: widget.inputColor == Colors.transparent ? false : true,
        fillColor: widget.inputColor,
        border: modelInputBorder(),
        focusedBorder: modelInputBorder(),
        enabledBorder: modelInputBorder(),
        errorBorder: modelInputBorder(),
        focusedErrorBorder: modelInputBorder(),
        suffixIcon: widget.obscureText
            ? Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  color: widget.iconColor,
                  icon: visibility
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() => visibility = !visibility);
                  },
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: widget.prefixIcon)
            : null,
        prefixIconColor: widget.iconColor,
        prefixText: widget.keyboardType == TextInputType.phone ? '+225 ' : null,
        prefixStyle: TextStyle(
            color: widget.textColor, fontWeight: FontWeight.w500, fontSize: 17),
      ),
      controller: widget.controller,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Champ requis !"),
        if (widget.labelText!.contains("mail"))
          FormBuilderValidators.email(errorText: "Entrez un email correct !"),
        if (widget.labelText!.contains("phone"))
          FormBuilderValidators.equalLength(10,
              errorText: "Numero de 10 chiffres requis !")
      ]),
    );
  }
}
