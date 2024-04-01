import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class BlackPhoneFieldInput extends StatelessWidget {
  const BlackPhoneFieldInput(
      {super.key,
      this.title,
      this.hintText,
      this.onChanged,
      this.controller,
      this.onTap,
      this.onSubmitted,
      this.undoController,
      this.onAppPrivateCommand,
      this.onEditingComplete,
      this.maxLength,
      this.focusNode,
      this.magnifierConfiguration,
      this.suffix,
      this.suffixIcon,
      this.suffixText,
      this.initialCountryCode = "+237",
      this.suffixIconConstraints});
  final String? title;
  final String? hintText;
  final void Function(PhoneNumber)? onChanged;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final UndoHistoryController? undoController;
  final void Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final void Function()? onEditingComplete;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextMagnifierConfiguration? magnifierConfiguration;

  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final String initialCountryCode;
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
          child: IntlPhoneField(
            onChanged: onChanged,
            controller: controller,
            onSubmitted: onSubmitted,
            onTap: onTap,
            keyboardType: TextInputType.phone,
            pickerDialogStyle: PickerDialogStyle(),
            initialCountryCode: initialCountryCode,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
            focusNode: focusNode,
            showCountryFlag: false,
            disableLengthCheck: true,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            cursorColor: Colors.black,
            languageCode: 'fr',
            countries: const [
              Country(
                name: "Cameroun",
                nameTranslations: {
                  "fr": "Cameroun",
                  "es": "Camerún",
                  "en": "Cameroon",
                },
                flag: "CM",
                code: "CM",
                dialCode: "237",
                minLength: 9,
                maxLength: 9,
              )
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              prefixStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff202020),
              ),
              hintStyle: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff757575),
              ),
            ),
          ),
        )
      ],
    );
  }
}
