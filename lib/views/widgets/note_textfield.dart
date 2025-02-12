import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      expands: true,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        contentPadding: EdgeInsets.all(20),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: "Notunuzu giriniz",
        border: OutlineInputBorder(),
      ),
      controller: controller,
    );
  }
}
