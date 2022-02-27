import 'package:astro/core/models/layer_response.dart';
import 'package:astro/features/question/data/models/question_category_data.dart';

abstract class QuestionRepository {
  Future<LayerResponse<List<QuestionCategoryData>>> getQuestionCategories();
}
