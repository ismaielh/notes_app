import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      emit(NotesSuccess(notesBox.values.toList()));
    } on Exception catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
