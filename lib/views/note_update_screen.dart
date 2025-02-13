import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/viewmodels/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:notepad/views/widgets/note_textfield.dart'; // NoteTextField widget'ını ekledik

class UpdateNoteScreen extends StatefulWidget {
  final NoteModel note;

  const UpdateNoteScreen({
    super.key,
    required this.note,
  });

  @override
  State<UpdateNoteScreen> createState() => _UpdateNoteScreenState();
}

class _UpdateNoteScreenState extends State<UpdateNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _showNoteInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Not Bilgileri'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow(
                'Oluşturulma Tarihi:',
                DateFormat('dd.MM.yyyy HH:mm', 'tr_TR')
                    .format(widget.note.createdAt)),
            const SizedBox(height: 8),
            _infoRow(
                'Son Güncelleme:',
                DateFormat('dd.MM.yyyy HH:mm', 'tr_TR')
                    .format(widget.note.updatedAt)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  Future<bool> _updateNote() async {
    if (_titleController.text.trim().isNotEmpty &&
        _contentController.text.trim().isNotEmpty) {
      bool response = await context.read<NoteProvider>().updateNote(
            noteId: widget.note.id.toString(),
            title: _titleController.text.trim(),
            content: _contentController.text.trim(),
          );

      if (response && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Not başarıyla güncellendi.'),
            duration: Duration(seconds: 1),
          ),
        );
        return true;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Başlık ve içerik boş olamaz'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _updateNote,
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
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
              controller: _titleController,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              await _updateNote();
              if (mounted) context.pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.info_outline, color: Colors.black),
              onPressed: _showNoteInfo,
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.black),
              onPressed: () async {
                await _updateNote();
                if (mounted) context.pop();
              },
            ),
          ],
        ),
        body: NoteTextField(
          controller: _contentController,
        ),
      ),
    );
  }
}
