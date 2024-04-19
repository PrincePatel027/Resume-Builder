import 'package:flutter/material.dart';

Widget customTextFormField({
  required String hintName,
  required IconData icon,
  required bool isPhone,
  required TextEditingController controller,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, left: 15, right: 15),
    child: TextFormField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintName,
        labelText: hintName,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    ),
  );
}
