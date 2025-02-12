import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notepad/viewmodels/note_provider.dart';
import 'package:notepad/views/widgets/note_textfield.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<bool> _saveNote() async {
    if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
      final success = await context.read<NoteProvider>().createNote(
            title: titleController.text.isEmpty
                ? 'Başlıksız'
                : titleController.text,
            content: contentController.text,
          );

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not başarıyka kaydedildi.')),
        );
      }
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _saveNote,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: TextField(
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w400),
              expands: false,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Başlık",
                  hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
              controller: titleController,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () async {
                await _saveNote();
                if (mounted) Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: NoteTextField(
          controller: contentController,
        ),
      ),
    );
  }
}
