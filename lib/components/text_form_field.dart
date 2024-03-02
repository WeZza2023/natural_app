import 'package:flutter/material.dart';
import 'package:natural_app/constants/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  bool isPassword = false,
  bool readOnly = false,
  required String? Function(String?)? validate,
  String? label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  Function()? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
      validator: validate,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(12),
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        hintText: 'Search for food',
        hintFadeDuration: const Duration(milliseconds: 200),
        hintStyle: const TextStyle(color: KMinFontColor, fontSize: 15),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
          gapPadding: 2,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
          gapPadding: 2,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(30),
          gapPadding: 2,
        ),
      ),
    );
