import 'package:astro/features/question/data/models/question_category_data.dart';
import 'package:astro/features/question/domain/repositories/question_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepository _questionRepository;

  QuestionBloc(this._questionRepository) : super(QuestionState()) {
    on<GetQuestionCategoriesEvent>((event, emit) async {
      emit(QuestionLoadingState());
      var response = await _questionRepository.getQuestionCategories();
      if (response.data != null) {
        emit(state.copyWith(
          data: response.data!,
        ));
      } else {}
    });

    on<CategorySelectionEvent>(((event, emit) {
      QuestionCategoryData categoryData = event.categoryData;
      categoryData.isSelected = true;
      emit(state.copyWith(selectedCategory: categoryData));
    }));
  }
}
