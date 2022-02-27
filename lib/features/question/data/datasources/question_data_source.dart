import 'package:astro/core/network/api_service.dart';
import 'package:astro/features/question/data/models/question_categories_response.dart';

abstract class QuestionDataSource {
  Future<QuestionCategoriesResponse> getQuestionCategories();
}

class QuestionDataSourceImpl implements QuestionDataSource {
  APIService _apiService;

  QuestionDataSourceImpl(this._apiService);

  @override
  Future<QuestionCategoriesResponse> getQuestionCategories() async {
    return await _apiService.getQuestionCategories();
  }
}
