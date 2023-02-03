// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    Key? key,
    required this.formController,
    required this.label,
    required this.hint,
  }) : super(key: key);

  final TextEditingController formController;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      child: TextFormField(
        controller: formController,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          hintText: hint,
        ),
      ),
    );
  }
}
