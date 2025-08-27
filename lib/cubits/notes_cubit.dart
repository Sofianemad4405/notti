import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notti/cubits/notes_states.dart';
import 'package:notti/models/note_model.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  void init() {
    getNotes();
  }

  Map<dynamic, NoteModel> getNotes() {
    emit(NotesLoadingState());
    try {
      emit(NotesLoadedState(notes: Hive.box<NoteModel>('notesBox').toMap()));
    } catch (e) {
      emit(NotesErrorState(error: e.toString()));
    }
    return Hive.box<NoteModel>('notesBox').toMap();
  }

  Color? color;

  void addNote(NoteModel note) {
    final box = Hive.box<NoteModel>('notesBox');
    note.color = color?.value ?? Color(0xFFFF6B6B).value;
    box.add(note);

    final updatedNotes = box.toMap();

    emit(NotesLoadedState(notes: updatedNotes));
  }

  void updateNote(int key, NoteModel note) {
    final box = Hive.box<NoteModel>('notesBox');
    box.put(key, note);
    final updatedNotes = box.toMap();
    emit(NotesLoadedState(notes: updatedNotes));
  }
}
