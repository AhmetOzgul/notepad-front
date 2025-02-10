import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text("Başlık"),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: TextField(
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(20),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Notunuzu giriniz",
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(),
      ),
    );
  }
}
