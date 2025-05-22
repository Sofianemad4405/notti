import 'package:notti/models/note_model.dart';

abstract class NotesStates {}

class NotesInitialState extends NotesStates {}

class NotesLoadingState extends NotesStates {}

class NotesErrorState extends NotesStates {
  final String error;

  NotesErrorState({required this.error});
}

class NotesLoadedState extends NotesStates {
  final Map<dynamic, NoteModel> notes;

  NotesLoadedState({required this.notes});
}
