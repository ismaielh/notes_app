part of 'notes_cubit.dart';

// تعريف الحالات بشكل غير قابل للتغيير (immutable)
@immutable
sealed class NotesState {}

// الحالة الأولى عند بدء التطبيق
final class NotesInitial extends NotesState {}
final class NotesSuccess extends NotesState{}
