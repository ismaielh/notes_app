import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    // استدعاء fetchAllNotes عند بدء التطبيق
    context.read<NotesCubit>().fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // التحقق من حالة البيانات
        if (state is NotesSuccess) {
          final notes = state.notes; // جلب الملاحظات من الحالة
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

        // عرض مؤشر التحميل عند جلب البيانات أو في حالة البيانات الأولية
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
