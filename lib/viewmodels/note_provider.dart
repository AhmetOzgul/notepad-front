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

  Future<bool> createNote({
    required String title,
    required String content,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _noteService.createNote(
        title: title,
        content: content,
      );

      if (response != null && response['status'] == 200) {
        await getNotes();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Not oluşturma hatası: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateNote({
    required String noteId,
    required String title,
    required String content,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _noteService.updateNote(
        noteId: noteId,
        title: title,
        content: content,
      );

      if (response != null && response['status'] == 200) {
        await getNotes();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Not güncelleme hatası: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteNotes({required List<int> noteIds}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _noteService.deleteNotes(noteIds: noteIds);

      if (response != null && response['status'] == 200) {
        await getNotes();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Not silme hatası: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
