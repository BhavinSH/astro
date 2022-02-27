part of 'question_bloc.dart';

@immutable
abstract class QuestionEvent {}

class GetQuestionCategoriesEvent extends QuestionEvent {}

class CategorySelectionEvent extends QuestionEvent {
  final QuestionCategoryData categoryData;

  CategorySelectionEvent(this.categoryData);
}
