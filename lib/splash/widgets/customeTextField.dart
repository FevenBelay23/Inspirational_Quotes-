import 'package:flutter/material.dart';
import '../utilities/ColorPallets.dart';

Widget customTextField(
    IconData icon, String hintText, bool isPassword, bool isEmail,
    {required TextEditingController controller,
    String? Function(String?)? validator}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextFormField(
      validator: validator,
      obscureText: isPassword,
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: ColorPalettes.iconColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalettes.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalettes.textColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: const EdgeInsets.all(10),
        labelText: hintText,
        hintStyle:
            const TextStyle(fontSize: 14, color: ColorPalettes.textColor1),
      ),
    ),
  );
}
