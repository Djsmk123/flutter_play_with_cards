import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
              enabledBorder: border(),
              errorBorder: border(),
              focusedErrorBorder: border(),
              errorStyle: const TextStyle(color: Colors.white),
              focusedBorder: border()),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
