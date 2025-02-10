import 'package:flutter/material.dart';
import 'package:notepad/models/note_model.dart';
import 'package:notepad/services/note_service.dart';

class NoteProvider extends ChangeNotifier {
  final NoteService _noteService = NoteService();
  List<NoteModel> _notes = [];
  bool _isLoading = false;

  List<NoteModel> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> getNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _noteService.getNotes();

      if (response != null && response['data'] != null) {
        _notes = (response['data'] as List)
            .map((note) => NoteModel.fromJson(note))
            .toList();
      } else {
        _notes = [];
      }
    } catch (e) {
      debugPrint('Not getirme hatası: $e');
      _notes = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
