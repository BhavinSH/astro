part of 'question_bloc.dart';

enum Status { loading, success, error }

@immutable
class QuestionState {
  List<QuestionCategoryData>? data = List.empty(growable: true);
  QuestionCategoryData? selectedCategory;

  QuestionState({this.data, this.selectedCategory});

  QuestionState copyWith({
    List<QuestionCategoryData>? data,
    QuestionCategoryData? selectedCategory,
  }) {
    return QuestionState(
      data: data ?? this.data,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

// class QuestionInitial extends QuestionState {}

class QuestionLoadingState extends QuestionState {}

// class QuestionCategoryDataState extends QuestionState {
//   List<QuestionCategoryData>? data = List.empty(growable: true);
//   QuestionCategoryData? selectedCategory;

//   QuestionCategoryDataState({this.data, this.selectedCategory});

//   QuestionCategoryDataState copyWith({
//     List<QuestionCategoryData>? data,
//     QuestionCategoryData? selectedCategory,
//   }) {
//     return QuestionCategoryDataState(
//       data: data ?? this.data,
//       selectedCategory: selectedCategory ?? this.selectedCategory,
//     );
//   }
// }

// class QuestionCategorySelectionState extends QuestionState {
//   QuestionCategoryData data;

//   QuestionCategorySelectionState(this.data);
// }
