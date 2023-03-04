import 'package:barber_shop/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class EachForm extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType keyBoard;
  final bool obscureText;
  final dynamic validator;

  const EachForm(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyBoard,
      required this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TextFormField(
          keyboardType: keyBoard,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.pink,
            )),
            contentPadding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          ),
          style: const TextStyle(color: ThemeColors.background),
        ),
      ),
    );
  }
}
