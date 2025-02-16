import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  // دالة لجلب جميع الملاحظات
  void fetchAllNotes() {
    print("Fetching notes..."); // تصريح لتتبع العملية
    var notesBox = Hive.box<NoteModel>(kNotesBox); // فتح الصندوق الذي يحتوي على الملاحظات
    notes = notesBox.values.toList(); // تحويل القيم في الصندوق إلى قائمة
    emit(NotesSuccess(notes!)); // إعلام الواجهة بأن البيانات جاهزة
    print("Notes fetched: ${notes?.length} notes"); // تصريح لعدد الملاحظات المجلوبة
  }
}
