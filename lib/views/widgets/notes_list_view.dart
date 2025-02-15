import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // استدعاء fetchAllNotes عند بدء التطبيق
        if (state is NotesInitial) {
          context.read<NotesCubit>().fetchAllNotes();
        }

        // التحقق من حالة البيانات
        if (state is NotesSuccess) {
          final notes = context.read<NotesCubit>().notes ??
              []; // جلب الملاحظات من الـCubit
          if (notes.isEmpty) {
            return Center(child: Text('No notes available'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              },
            ),
          );
        }

        // عرض مؤشر التحميل عند جلب البيانات
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
