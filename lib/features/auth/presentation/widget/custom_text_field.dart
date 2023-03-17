import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.obscrueText = false,
    required this.hint,
    required this.editingController,
  }) : super(key: key);
  final bool obscrueText;
  final String hint;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      child: TextFormField(
        controller: editingController,
        obscureText: obscrueText,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
