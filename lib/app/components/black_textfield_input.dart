import 'package:flutter/material.dart';

class BlackTextFieldInput extends StatelessWidget {
  const BlackTextFieldInput(
      {super.key,
      this.title,
      this.hintText,
      this.onChanged,
      this.controller,
      this.onTap,
      this.onSubmitted,
      this.obscureText = false,
      this.keyboardType,
      this.keyboardAppearance,
      this.obscuringCharacter = '•',
      this.autofocus = false,
      this.expands = false,
      this.maxLines = 1,
      this.minLines,
      this.readOnly = false,
      this.undoController,
      this.onAppPrivateCommand,
      this.onEditingComplete,
      this.maxLength,
      this.focusNode,
      this.magnifierConfiguration,
      this.enableSuggestions = true,
      this.prefix,
      this.prefixIcon,
      this.prefixText,
      this.prefixIconConstraints,
      this.suffix,
      this.suffixIcon,
      this.suffixText,
      this.suffixIconConstraints});
  final String? title;
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;
  final String obscuringCharacter;
  final bool autofocus;
  final bool expands;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final UndoHistoryController? undoController;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final void Function()? onEditingComplete;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final bool enableSuggestions;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final BoxConstraints? suffixIconConstraints;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff202020),
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 224, 224, 224)),
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            onTap: onTap,
            onSubmitted: onSubmitted,
            obscureText: obscureText,
            keyboardType: keyboardType,
            keyboardAppearance: keyboardAppearance,
            obscuringCharacter: obscuringCharacter,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
            autofocus: autofocus,
            expands: expands,
            maxLines: maxLines,
            minLines: minLines,
            readOnly: readOnly,
            undoController: undoController,
            onAppPrivateCommand: onAppPrivateCommand,
            onEditingComplete: onEditingComplete,
            maxLength: maxLength,
            focusNode: focusNode,
            magnifierConfiguration: magnifierConfiguration,
            enableSuggestions: enableSuggestions,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                prefix: prefix,
                prefixIcon: prefixIcon,
                prefixText: prefixText,
                prefixStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff202020),
                ),
                prefixIconConstraints: prefixIconConstraints,
                suffix: suffix,
                suffixIcon: suffixIcon,
                hintStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff757575),
                ),
                suffixText: suffixText,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIconConstraints: suffixIconConstraints),
          ),
        )
      ],
    );
  }
}
